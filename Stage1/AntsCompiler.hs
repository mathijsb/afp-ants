module AntsCompiler 
	(
		compileAnts
	) 
	where

import AntsBase

antsAlgebra :: AntsAlgebra [Char] [Char]	
antsAlgebra = (concat, 
			   id)

compileAnts :: Program -> [Char]
compileAnts = foldAntsAlgebra antsAlgebra