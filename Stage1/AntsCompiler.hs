module AntsCompiler 
	(
		compileAnts
	) 
	where

import AntsBase

type ProgramFlow = Int

antsAlgebra :: AntsAlgebra [Char] [Char] (ProgramFlow -> [Char])
antsAlgebra = (compileProgram,
			   compileFunction,
			   (compileStatementIf, compileStatement))

	where
		compileProgram = concat
		compileFunction ident statements = ident ++ ":\n" ++ (concat . map ($1) $ statements)
		compileStatementIf sts1 sts2 sts3 = (\flow -> undefined)
		compileStatement (Sense direction condition) = (\flow -> "SENSE " ++ show direction ++ " " ++ show condition ++ " OR GOTO label" ++ show flow)



compileAnts :: Program -> [Char]
compileAnts = foldAntsAlgebra antsAlgebra