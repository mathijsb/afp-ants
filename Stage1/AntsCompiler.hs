module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Stage1.AntsBase
import Stage2.Base

type ProgramFlow = ADest

antsAlgebra :: AntsAlgebra [AInstruction] [AInstruction] (ProgramFlow -> [AInstruction])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatementWhile, compileStatement))

	where
		compileProgram instrs = [ALabel1 "START"] ++ concat instrs ++ [AGoto "START"]
		compileFunction ident statements = [ALabel1 ident] ++ (concat . map ($(ALabel ident )) $ statements)

		compileStatementIf sts1 sts2 sts3 = (\flow -> (applyFlow sts1 flow) 
														++ (applyFlow sts2 flow) 
														++ [ALabel1 "IFNOT"] 
														++ (applyFlow sts3 flow))

		compileStatementWhile sts1 sts2 = (\flow -> [ALabel1 "WHILE"]
												 ++ (applyFlow sts1 (ALabel "IFNOT")) 
												 ++ (applyFlow sts2 (ARelative 1)) 
												 ++ [AGoto "WHILE"]
												 ++ [ALabel1 "IFNOT"])

		compileStatement (Sense direction condition) = (\flow -> [ASense direction condition flow])
		compileStatement Move = (\flow -> [AMove flow])

		applyFlow sts flow = concat . map ($flow) $ sts


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra