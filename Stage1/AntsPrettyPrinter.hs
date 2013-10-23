module Stage1.AntsPrettyPrinter 
	(
		prettyPrintAfa
	) 
	where

import Common.Simulator (LeftOrRight(..))

import Stage1.AntsBase
import Stage2.Base
import Stage2.PrettyPrint

prettyPrintAfa :: [AInstruction] -> String
prettyPrintAfa = unlines . map instrToString
	where
		instrToString (ALabel1 str) = str ++ ":"
		instrToString i = instructionToString i