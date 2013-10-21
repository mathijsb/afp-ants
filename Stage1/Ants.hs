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

main = do
 	args <- getArgs
	case args of
		(file:[]) -> compileFile file
		otherwise -> putStrLn "Usage: ants [ants-file]"

compileFile file = do
	fileHandle <- openFile file ReadMode
	tokens <- liftM lexAntsString (hGetContents fileHandle)
	putStrLn $ "Tokens: " ++ show tokens
	putStrLn $ "AST: " ++ (show . parseAntsTokens $ tokens)
