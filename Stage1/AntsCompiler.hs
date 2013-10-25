module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Data.Maybe
import Stage1.AntsBase
import Stage2.Base

type ProgramFlow = (ADest, String, Maybe String)

antsAlgebra :: AntsAlgebra [AInstruction] [AInstruction] (ProgramFlow -> [AInstruction])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatement))

	where
		compileProgram instrs = [ALabel1 "START"] ++ concat instrs ++ [AGoto "START"]
		compileFunction ident sts = [ALabel1 ident] ++ (applyFlow sts (ARelative 1) ident Nothing)

		compileStatementIf sts1 sts2 sts3 (flow, context, brk) = 
			    (applyFlow sts1 (ALabel (context ++ "_ELSE")) (context ++ "_ELSE") brk) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_IF") brk) 
			 ++ [ALabel1 (context ++ "_ELSE")]
			 ++ (applyFlow sts3 (ARelative 1) (context ++ "_ELSE") brk) 

		compileStatementWhile sts1 sts2 (flow, context, brk) = 
				[ALabel1 (context ++ "_WHILE")]
			 ++ (applyFlow sts1 (ALabel (context ++ "_IFNOT")) (context ++ "_WHILE") Nothing) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_WHILE") (Just (context ++ "_IFNOT"))) 
			 ++ [AGoto (context ++ "_WHILE")]
			 ++ [ALabel1 (context ++ "_IFNOT")]

		compileStatement (Not stm) = (\(flow, context, brk) -> (compileStatement stm ((ARelative 2), context, brk)) ++ [jumpOrGoto flow])
		compileStatement (Sense direction condition) = (\(flow, context, brk) -> [ASense direction condition flow])
		compileStatement Move = (\(flow, context, brk) -> [AMove flow])
		compileStatement (Mark num) = (\(flow, context, brk) -> [AMark num])
		compileStatement (Unmark num) = (\(flow, context, brk) -> [AUnmark num])
		compileStatement PickUp = (\(flow, context, brk) -> [APickUp flow])
		compileStatement Drop = (\(flow, context, brk) -> [ADrop])
		compileStatement (Turn dir) = (\(flow, context, brk) -> [ATurn dir])
		compileStatement (Flip num) = (\(flow, context, brk) -> [AFlip num flow])
		compileStatement Break = (\(flow, context, brk) -> case brk of 
				Just x -> [AGoto x]
				Nothing -> error "Break without an enclosing while statement")

		applyFlow sts dest context brk = concat . zipWith ($) sts $ map (\i -> (dest, context ++ "_" ++ show i, brk)) [1..]


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra

jumpOrGoto :: ADest -> AInstruction
jumpOrGoto (ALabel l) = AGoto l
jumpOrGoto (ARelative i) = AJump i