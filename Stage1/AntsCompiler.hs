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

{-
		compileExpressionAnd expr1 expr2 f (flow, context, brk, env) = (expr1 f (flow, context ++ "_1", brk, env)) ++ (expr2 f (flow, context ++ "_2", brk, env))
		compileExpressionOr expr1 expr2 f (flow, context, brk, env) = (expr1 f (ALabel (context ++ "_OR2"), context ++ "_1", brk, env)) ++ [AGoto (context ++ "_OREND"), ALabel1 (context ++ "_OR2")] ++ (expr2 f (flow, context ++ "_2", brk, env)) ++ [ALabel1 (context ++ "_OREND")]
		compileExpressionEquals ctype var val f (flow, context, brk, env) = if (op ctype (env M.! var) val) then [] else [jumpOrGoto flow]
			where
				op CLT = (<)
				op CGT = (>)
				op CLE = (<=)
				op CGE = (>=)
				op CEQ = (==)
				op CNE = (/=)
-}

		compileExpressionFunctionCall name vars st = gen st {env = M.union functionEnvironment (env st)}
			where
				functionEnvironment = M.fromList $ zipWith (,) decls (map (resolveVar st) vars)
				(decls, gen) = resolveFunction (functions st) name

		compileExpressionAnd expr1 expr2 st = liftM2 (++) (expr1 st) (expr2 st)
		compileExpressionOr expr1 expr2 st = do
			(labelOr2, labelOrEnd) <- uniqueLabelTup ("OR2", "END")
			liftM2 (\e1 e2 -> e1 ++ e2 ) (expr1 st {failDestination = (ALabel labelOr2)}) (expr2 st) 

		compileExpressionEquals ctype var val st = undefined
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

{-
		compileProgram instrs = [ALabel1 "START"] ++ (((snd . lookupFunction) "main") (ARelative 1, "", Nothing, M.empty)) ++ [AGoto "START"]
			where lookupFunction name = case lookup name . map ($lookupFunction) $ instrs of
				 	Just e -> e
				 	Nothing -> error $ "function '" ++ name ++ "' is invoked but not defined."

		compileFunction ident decls sts f = (ident, (decls, ((\(flow, context, brk, env) -> (applyFlow sts flow context brk f env)))))

		compileStatementIf expr sts2 sts3 f (flow, context, brk, env) = 
				case expressionInstructions of
					[] -> ifInstructions
					otherwise -> expressionInstructions
			 			++ ifInstructions
			 			++ [AGoto (context ++ "_END")]
			 			++ [ALabel1 (context ++ "_ELSE")]
			 			++ (applyFlow sts3 (ARelative 1) (context ++ "_ELSE") brk f env) 
			 			++ [ALabel1 (context ++ "_END")]
			 	where
			 		expressionInstructions = expr f (ALabel (context ++ "_ELSE"), context ++ "_IF", Nothing, env)
			 		ifInstructions = (applyFlow sts2 (ARelative 1) (context ++ "_IF") brk f env) 

		compileStatementWhile expr sts2 f (flow, context, brk, env) = 
				[ALabel1 (context ++ "_WHILE")]
			 ++ expr f (ALabel (context ++ "_IFNOT"), context ++ "_WHILE", Nothing, env)
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_WHILE") (Just (context ++ "_IFNOT")) f env) 
			 ++ [AGoto (context ++ "_WHILE")]
			 ++ [ALabel1 (context ++ "_IFNOT")]

		compileStatementBreak f (flow, context, brk, env) = case brk of 
				Just x -> [AGoto x]
				Nothing -> error "Break without an enclosing while statement"

		compileStatementExpr expr f = expr f
		compileStatementTimes var times sts f (flow, context, brk, env) = concat . map compile $ [1 .. (resolveVar times)]
			where 
				compile n = applyFlow sts flow (context ++ "_" ++ show n) brk f (M.insert var n env)
				resolveVar (Var name) = env M.! name
				resolveVar (Value val) = val

		compileExpressionCommand = id
		compileExpressionNot expr f (flow, context, brk, env) = (expr f (ALabel (context ++ "_NOTEND"), context, brk, env)) ++ [jumpOrGoto flow] ++ [ALabel1 (context ++ "_NOTEND")]
		compileExpressionBool bool _ _ = []
		
		compileExpressionFunctionCall name vars f (flow, context, brk, env) = cont (flow, context, brk, M.union functionEnvironment env)
			where
				functionEnvironment = M.fromList $ zipWith (,) decls (map resolveVar vars)
				resolveVar (Var name) = env M.! name
				resolveVar (Value val) = val
				(decls, cont) = f name

		compileExpressionAnd expr1 expr2 f (flow, context, brk, env) = (expr1 f (flow, context ++ "_1", brk, env)) ++ (expr2 f (flow, context ++ "_2", brk, env))
		compileExpressionOr expr1 expr2 f (flow, context, brk, env) = (expr1 f (ALabel (context ++ "_OR2"), context ++ "_1", brk, env)) ++ [AGoto (context ++ "_OREND"), ALabel1 (context ++ "_OR2")] ++ (expr2 f (flow, context ++ "_2", brk, env)) ++ [ALabel1 (context ++ "_OREND")]
		compileExpressionEquals ctype var val f (flow, context, brk, env) = if (op ctype (env M.! var) val) then [] else [jumpOrGoto flow]
			where
				op CLT = (<)
				op CGT = (>)
				op CLE = (<=)
				op CGE = (>=)
				op CEQ = (==)
				op CNE = (/=)

		compileCommand (Sense direction condition) f (flow, context, brk, env) = case condition of
			MarkerVar n -> [ASense direction (Marker $ env M.! n) flow]
			otherwise -> [ASense direction condition flow]
		compileCommand Move f (flow, context, brk, env) = [AMove flow]
		compileCommand (Mark num) f _ = [AMark num]
		compileCommand (Unmark num) f _ = [AUnmark num]
		compileCommand PickUp f (flow, context, brk, env) = [APickUp flow]
		compileCommand Drop f _ = [ADrop]
		compileCommand (Turn dir) f _ = [ATurn dir]
		compileCommand (Flip num) f (flow, context, brk, env) = [AFlip num flow]
		compileCommand Nop f _ = [ANop]

		applyFlow sts dest context brk f env = concat . zipWith ($) (map ($f) sts) $ map (\i -> (dest, context ++ "_" ++ show i, brk, env)) [1..]

-}

compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i
