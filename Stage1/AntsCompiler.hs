module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Stage1.AntsBase
import Stage2.Base

type ProgramFlow = (ADest, String)

antsAlgebra :: AntsAlgebra [AInstruction] [AInstruction] (ProgramFlow -> [AInstruction])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatement))

	where
		compileProgram instrs = [ALabel1 "START"] ++ concat instrs ++ [AGoto "START"]
		compileFunction ident sts = [ALabel1 ident] ++ (applyFlow sts (ARelative 1) ident)   -- undefined -- [ALabel1 ident] ++ (concat . map ($(ALabel ident )) $ statements)

		compileStatementIf sts1 sts2 sts3 (flow, context) = 
			    (applyFlow sts1 (ALabel (context ++ "_ELSE")) (context ++ "_ELSE")) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_IF")) 
			 ++ [ALabel1 (context ++ "_ELSE")]
			 ++ (applyFlow sts3 (ARelative 1) (context ++ "_ELSE")) 

		compileStatementWhile sts1 sts2 (flow, context) = 
				[ALabel1 (context ++ "_WHILE")]
			 ++ (applyFlow sts1 (ALabel (context ++ "_IFNOT")) (context ++ "_WHILE")) 
			 ++ (applyFlow sts2 (ARelative 1) (context ++ "_WHILE")) 
			 ++ [AGoto (context ++ "_WHILE")]
			 ++ [ALabel1 (context ++ "_IFNOT")]

		compileStatement (Sense direction condition) = (\(flow, context) -> [ASense direction condition flow])
		compileStatement Move = (\(flow, context) -> [AMove flow])
		compileStatement (Mark num) = (\(flow, context) -> [AMark num])
		compileStatement (Unmark num) = (\(flow, context) -> [AUnmark num])
		compileStatement PickUp = (\(flow, context) -> [APickUp flow])
		compileStatement Drop = (\(flow, context) -> [ADrop])
		compileStatement (Turn dir) = (\(flow, context) -> [ATurn dir])
		compileStatement (Flip num) = (\(flow, context) -> [ADrop])

		applyFlow sts dest context = concat . zipWith ($) sts $ map (\i -> (dest, context ++ "_" ++ show i)) [1..]


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra