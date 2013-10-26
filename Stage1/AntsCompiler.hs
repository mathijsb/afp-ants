module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Data.Maybe
import Data.List
import Stage1.AntsBase
import Stage2.Base
import Debug.Trace

type FunctionLookup = String -> (ProgramFlow -> [AInstruction])
type ProgramFlow = (ADest, String, Maybe String)
type LabeledFunction = (String, ProgramFlow -> [AInstruction])

antsAlgebra :: AntsAlgebra [AInstruction] 
						   (FunctionLookup -> LabeledFunction) 
						   (FunctionLookup -> ProgramFlow -> [AInstruction]) 
						   (FunctionLookup -> ProgramFlow -> [AInstruction])

antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatementBreak, compileStatementExpr),
			   compileExpression)

	where

		compileProgram instrs = [ALabel1 "START"] ++ (lookupFunction "main" $ (ARelative 1, "", Nothing)) ++ [AGoto "START"]
			where lookupFunction name = case lookup name . map ($lookupFunction) $ instrs of
				 	Just e -> e
				 	Nothing -> error $ "function '" ++ name ++ "' is invoked but not defined."

		compileFunction ident sts f = (ident, ((\(flow, context, brk) -> (applyFlow sts flow context brk f))))

		compileStatementIf expr sts2 sts3 f (flow, context, brk) = 
			    expr f (ALabel (context ++ "_ELSE"), context ++ "_IF", Nothing)
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_IF") brk f) 
			 ++ [ALabel1 (context ++ "_ELSE")]
			 ++ (applyFlow sts3 (ARelative 1) (context ++ "_ELSE") brk f) 

		compileStatementWhile expr sts2 f (flow, context, brk) = 
				[ALabel1 (context ++ "_WHILE")]
			 ++ expr f (ALabel (context ++ "_IFNOT"), context ++ "_WHILE", Nothing)
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_WHILE") (Just (context ++ "_IFNOT")) f) 
			 ++ [AGoto (context ++ "_WHILE")]
			 ++ [ALabel1 (context ++ "_IFNOT")]

		compileStatementBreak f (flow, context, brk) = case brk of 
				Just x -> [AGoto x]
				Nothing -> error "Break without an enclosing while statement"

		compileStatementExpr expr f = expr f

		compileExpression (Not stm) f = (\(flow, context, brk) -> (compileExpression stm f ((ARelative 2), context, brk)) ++ [jumpOrGoto flow])
		compileExpression (Sense direction condition) f = (\(flow, context, brk) -> [ASense direction condition flow])
		compileExpression Move f = (\(flow, context, brk) -> [AMove flow])
		compileExpression (Mark num) f = (\(flow, context, brk) -> [AMark num])
		compileExpression (Unmark num) f = (\(flow, context, brk) -> [AUnmark num])
		compileExpression PickUp f = (\(flow, context, brk) -> [APickUp flow])
		compileExpression Drop f = (\(flow, context, brk) -> [ADrop])
		compileExpression (Turn dir) f  = (\(flow, context, brk) -> [ATurn dir])
		compileExpression (Flip num) f = (\(flow, context, brk) -> [AFlip num flow])
		compileExpression (BoolExpression true) f = (\(flow, context, brk) -> [])

		compileExpression (FunctionCall name) f = (f name)

		applyFlow sts dest context brk f = concat . zipWith ($) (map ($f) sts) $ map (\i -> (dest, context ++ "_" ++ show i, brk)) [1..]


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i