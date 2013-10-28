module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import qualified Data.Map as M
import Data.Maybe
import Data.List
import Stage1.AntsBase
import Stage2.Base
import Debug.Trace

type FunctionLookup = String -> ([String], ProgramFlow -> [AInstruction])
type Environment = M.Map String Int
type ProgramFlow = (ADest, String, Maybe String, Environment)
type LabeledFunction = (String, ([String], ProgramFlow -> [AInstruction]))

antsAlgebra :: AntsAlgebra [AInstruction] 
						   (FunctionLookup -> LabeledFunction) 
						   (FunctionLookup -> ProgramFlow -> [AInstruction]) 
						   (FunctionLookup -> ProgramFlow -> [AInstruction])
						   (FunctionLookup -> ProgramFlow -> [AInstruction])

antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatementBreak, compileStatementExpr, compileStatementTimes),
			   (compileExpressionCommand, compileExpressionNot, compileExpressionBool, compileExpressionFunctionCall, compileExpressionAnd, compileExpressionOr, compileExpressionEquals),
			   compileCommand)

	where

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


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i
