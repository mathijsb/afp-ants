module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Data.Maybe
import Stage1.AntsBase
import Stage2.Base

type ProgramFlow = (ADest, String, Maybe String)

antsAlgebra :: AntsAlgebra [AInstruction] [AInstruction] (ProgramFlow -> [AInstruction]) (ProgramFlow -> [AInstruction])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatementBreak, compileStatementExpr),
			   compileExpression)

	where
		compileProgram instrs = [ALabel1 "START"] ++ concat instrs ++ [AGoto "START"]
		compileFunction ident sts = [ALabel1 ident] ++ (applyFlow sts (ARelative 1) ident Nothing)

		compileStatementIf expr sts2 sts3 (flow, context, brk) = 
			    expr (ALabel (context ++ "_ELSE"), context ++ "_IF", Nothing) --- (applyFlow sts1 (ALabel (context ++ "_ELSE")) (context ++ "_ELSE") brk) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_IF") brk) 
			 ++ [ALabel1 (context ++ "_ELSE")]
			 ++ (applyFlow sts3 (ARelative 1) (context ++ "_ELSE") brk) 

		compileStatementWhile expr sts2 (flow, context, brk) = 
				[ALabel1 (context ++ "_WHILE")]
			 ++ expr (ALabel (context ++ "_IFNOT"), context ++ "_WHILE", Nothing) -- (applyFlow sts1 (ALabel (context ++ "_IFNOT")) (context ++ "_WHILE") Nothing) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_WHILE") (Just (context ++ "_IFNOT"))) 
			 ++ [AGoto (context ++ "_WHILE")]
			 ++ [ALabel1 (context ++ "_IFNOT")]

		compileStatementBreak (flow, context, brk) = case brk of 
				Just x -> [AGoto x]
				Nothing -> error "Break without an enclosing while statement"

		compileStatementExpr expr f = expr f

		compileExpression (Not stm) = (\(flow, context, brk) -> (compileExpression stm ((ARelative 2), context, brk)) ++ [jumpOrGoto flow])
		compileExpression (Sense direction condition) = (\(flow, context, brk) -> [ASense direction condition flow])
		compileExpression Move = (\(flow, context, brk) -> [AMove flow])
		compileExpression (Mark num) = (\(flow, context, brk) -> [AMark num])
		compileExpression (Unmark num) = (\(flow, context, brk) -> [AUnmark num])
		compileExpression PickUp = (\(flow, context, brk) -> [APickUp flow])
		compileExpression Drop = (\(flow, context, brk) -> [ADrop])
		compileExpression (Turn dir) = (\(flow, context, brk) -> [ATurn dir])
		compileExpression (Flip num) = (\(flow, context, brk) -> [AFlip num flow])
		compileExpression (BoolExpression true) = (\(flow, context, brk) -> [])

		applyFlow sts dest context brk = concat . zipWith ($) sts $ map (\i -> (dest, context ++ "_" ++ show i, brk)) [1..]


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i