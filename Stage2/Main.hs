-- | Main program for the /Assembler for Ambiants/ (AFA) assembler.

module Stage2.Main (
    main,
    assembleFile
) where

import System.IO (putStrLn, openFile, hGetContents, hPutStr, hClose,
                  hPrint, IOMode(ReadMode, WriteMode))
import System.Environment (getArgs, getProgName)
import System.FilePath.Posix (addExtension, splitExtension)
import System.Exit (exitFailure)
import Data.List (intersperse)
import Control.Exception (throwIO, Exception)

import Stage2.Assembler (assemble, assembleWithInfo, validate)
import Stage2.Parse (parseAssembler)
import Stage2.PrettyPrint (Ant(..))

import Control.DeepSeq (force)

-- | Assembler for Ambiants main program.
main :: IO ()
main = do
 	args <- getArgs
	case args of
		[file]         -> assembleFile file (replaceOrAddExtension ".afa" ".ant" file)
		[ifile, ofile] -> assembleFile ifile ofile
		_              -> usage [Value "afa-file", Optional $ Value "ant-file"]

-- | Displays the given invocation information and exits the program with a 
-- non-zero exit code.
usage :: Invocation -> IO ()
usage i = do putStr "Usage: "
             progName <- getProgName
             putStrLn (showInvocation (Literal progName : i))
             exitFailure

-- | Returns human-readable information on how to specify arguments based on the
-- given invocation information.
showInvocation :: Invocation -> String
showInvocation = concat . intersperse " " . map showArgument
  where showArgument a =
          case a of
            Value s          -> "<" ++ s ++ ">"
            Literal s        -> s
            Flag n Nothing   -> n
            Flag n (Just a') -> n ++ "=" ++ showArgument a'
            Optional a'      -> "[" ++ showArgument a' ++ "]"
            Alternative a'   -> concat . intersperse "|" $ map showArgument a'

type Invocation = [Argument]
data Argument = Optional Argument           -- ^ Optional argument
              | Alternative [Argument]      -- ^ Choice between altenatives
              | Literal String              -- ^ Literal value that must be present
              | Value String                -- ^ Named (string) argument
              | Flag String (Maybe Argument)-- ^ Flag that may have a value

-- | Replaces the extension in the path on an extension match, otherwise appends
-- the filename with the given extension.
replaceOrAddExtension :: String   -- ^ Extension to match for.
                      -> String   -- ^ Extension to replace with or to add.
                      -> FilePath
                      -> FilePath
replaceOrAddExtension match repl file =
  let (base, ext) = splitExtension file
  in if ext == match
       then addExtension base repl
       else addExtension file repl

-- | Throws an exception in case the Either value passed is 'Left', otherwise
-- returns the value in 'Right'.
throwOnError :: Exception e => Either e a -> IO a
throwOnError (Left e) = throwIO e
throwOnError (Right r) = return r

-- | Assembles the input file, placing the contents in the output file.
assembleFile :: FilePath -> FilePath -> IO ()
assembleFile ifile ofile = do
    inputHandle <- openFile ifile ReadMode
    contents <- hGetContents inputHandle
    outputHandle <- openFile ofile WriteMode
    code <- throwOnError . validate . force $ parseAssembler contents
    hPrint outputHandle . Ant $ assemble code
    hClose inputHandle
    hClose outputHandle

