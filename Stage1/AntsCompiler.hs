module Stage1.AntsCompiler 
	(
		compileAnts
	) 
	where

import Stage1.AntsBase
import Stage2.Base

type ProgramFlow = Label

antsAlgebra :: AntsAlgebra [AInstruction] [AInstruction] (ProgramFlow -> [AInstruction])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatement))

	where
		compileProgram = concat
		compileFunction ident statements = [ALabel1 ident] ++ (concat . map ($"") $ statements)
		compileStatementIf sts1 sts2 sts3 = (\flow -> (applyFlow sts1 flow) 
														++ (applyFlow sts2 flow) 
														++ [ALabel1 "IFNOT"] 
														++ (applyFlow sts3 flow))

		compileStatement (Sense direction condition) = (\flow -> [ASense direction condition (ALabel flow)])
		compileStatement Move = (\flow -> [AMove (ALabel flow)])

		applyFlow sts flow = concat . map ($flow) $ sts


compileAnts :: Program -> [AInstruction]
compileAnts = foldAntsAlgebra antsAlgebra