module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import qualified Data.Map as M
import Data.Maybe
import Data.List
import Control.Monad.State
import Control.Monad
import Control.Applicative
import Stage1.AntsBase
import Stage2.Base
import Debug.Trace

type Environment = M.Map VarName Int

data CompilerState = CompilerState {
	functions :: [LabeledFunction],
	env :: Environment,
	failDestination :: ADest,
	breakDestination :: Maybe Label,
	context :: String

}

type Generator = CompilerState -> (State Int [AInstruction])
type LabeledFunction = (FuncName, ([VarName], Generator))

antsAlgebra :: AntsAlgebra [AInstruction] 
						   LabeledFunction
						   Generator 
						   Generator
						   Generator

antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatementBreak, 
			   	compileStatementExpr, compileStatementTimes),
			   (compileExpressionCommand, compileExpressionNot, compileExpressionBool, 
			   	compileExpressionFunctionCall, compileExpressionAnd, compileExpressionOr, 
			   	compileExpressionEquals),
			   compileCommand)

	where

		compileProgram funcs = 
			let initialState = CompilerState funcs M.empty (ARelative 1) Nothing ""
			    (_, mainGen) = resolveFunction funcs "main"
			    mainCode = fst . runState (mainGen initialState) $ 0
			in [ALabel1 "START"] ++ mainCode ++ [AGoto "START"]

		compileFunction ident decls sts = (ident, (decls, mergeGenerators sts))

		compileStatementIf expr sts1 sts2 st = do
			(labelElse, labelEnd) <- uniqueLabelTup ("ELSE", "END")
			expressionInstructions <- expr st {failDestination = (ALabel labelElse)}
			ifInstructions <- mergeGenerators sts1 st
			elseInstructions <- mergeGenerators sts2 st
			case expressionInstructions of
				[] -> return ifInstructions
				otherwise -> return . concat $ [expressionInstructions, ifInstructions, 
					[AGoto labelEnd, ALabel1 labelElse], elseInstructions, [ALabel1 labelEnd]]

		compileStatementWhile expr sts st = do
			(labelWhile, labelEnd) <- uniqueLabelTup ("WHILE", "END")			
			expressionInstructions <- expr st {failDestination = (ALabel labelEnd)}
			whileInstructions <- mergeGenerators sts st
			return . concat $ [[ALabel1 labelWhile], expressionInstructions, whileInstructions, 
				[AGoto labelWhile, ALabel1 labelEnd]]

		compileStatementBreak st = case breakDestination st of 
			Just x -> return [AGoto x]
			Nothing -> error "Break without an enclosing while statement"

		compileStatementExpr = id 
		compileStatementTimes var times sts st = liftM concat . sequence . map compile $ range
			where
				range = [1 .. (resolveVar st times)]
				compile n = mergeGenerators sts st {env = M.insert var n (env st)}

		compileExpressionNot expr st = do
			labelEnd <- uniqueLabel "NOT"
			liftM (++ [ALabel1 labelEnd]) $ expr st {failDestination = ALabel labelEnd}

		compileExpressionBool _ st = return []

		compileExpressionFunctionCall name vars st = gen st {env = M.union functionEnvironment (env st)}
			where
				functionEnvironment = M.fromList $ zipWith (,) decls (map (resolveVar st) vars)
				(decls, gen) = resolveFunction (functions st) name

		compileExpressionAnd expr1 expr2 st = liftM2 (++) (expr1 st) (expr2 st)
		compileExpressionOr expr1 expr2 st = do
			(labelOr2, labelOrEnd) <- uniqueLabelTup ("OR2", "END")
			expr1Code <- expr1 st {failDestination = (ALabel labelOr2)}
			expr2Code <- expr2 st
			return $ expr1Code ++ [AGoto labelOrEnd, ALabel1 labelOr2] ++ expr2Code ++ [ALabel1 labelOrEnd]

		compileExpressionEquals ctype var val st = return $ if (op ctype ((env st) M.! var) val) then [] else [jumpOrGoto (failDestination st)]
			where
				op CLT = (<)
				op CGT = (>)
				op CLE = (<=)
				op CGE = (>=)
				op CEQ = (==)
				op CNE = (/=)

		compileExpressionCommand = id 

		compileCommand Move st = return $ [AMove . failDestination $ st]
		compileCommand (Sense direction condition) st = case condition of
			MarkerVar n -> return [ASense direction (Marker ((env st) M.! n)) (failDestination st)]
			otherwise -> return [ASense direction condition (failDestination st)]

		compileCommand (Mark num) _ = return [AMark num]
		compileCommand (Unmark num) _ = return [AUnmark num]
		compileCommand PickUp st = return [APickUp (failDestination st)]
		compileCommand Drop _ = return [ADrop]
		compileCommand (Turn dir) _ = return [ATurn dir]
		compileCommand (Flip num) st = return [AFlip num (failDestination st)]
		compileCommand Nop _ = return [ANop]

		resolveFunction funcs name = case lookup name funcs of
			Just f -> f
			Nothing -> error $ "function '" ++ name ++ "' is invoked but not defined."

		resolveVar st (Var name) = (env st) M.! name
		resolveVar st (Value val) = val

		mergeGenerators gens st = liftM concat . sequence . map ($st) $ gens

		uniqueLabel label = get >>= (\x -> put (x + 1) >> return (label ++ "_" ++ show x))
		uniqueLabelTup (l1, l2) = get >>= (\x -> put (x + 1) >> return (l1 ++ "_" ++ show x, l2 ++ "_" ++ show x))

compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i
