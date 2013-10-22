module Ants 
	(
		main,
	) 
	where

import Control.Monad
import System.IO
import System.Environment

import AntsLexer
import AntsParser
import AntsCompiler

main = do
 	args <- getArgs
	case args of
		(file:[]) -> compileFile file
		otherwise -> putStrLn "Usage: ants [ants-file]"

compileFile file = do
	fileHandle <- openFile file ReadMode
	tokens <- liftM lexAntsString (hGetContents fileHandle)

	putStrLn "****************************************"
	putStrLn $ "Tokens: " ++ show tokens

	let ast = parseAntsTokens $ tokens

	putStrLn "****************************************"
	--putStrLn $ "AST: " ++ show ast

	putStrLn "****************************************"
	putStrLn $ "Compiled program:" ++ compileAnts ast
