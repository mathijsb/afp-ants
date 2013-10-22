module Stage2.PrettyPrint (
    assemblerToString,
    instructionToString,
    destToString
) where

import Data.Char (toUpper)

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..))

assemblerToString :: Assembler -> String
assemblerToString = ats . aInstrs
  where ats [] = []
        ats ((ll,i):as) =
          (unlines $ map (++ ":") ll ++ ["    " ++ instructionToString i])
                                     ++ ats as

instructionToString :: AInstruction -> String
instructionToString i = map toUpper . unwords $ case i of
  ASense dir cond dest -> ["SENSE", show dir, show cond,
                           "OR", destToString dest]
  AMark num            -> ["MARK", show num]
  AUnmark num          -> ["UNMARK", show num]
  APickUp dest         -> ["PICKUP OR", destToString dest]
  ADrop                -> ["DROP"]
  ATurn turn           -> ["TURN", show turn]
  AMove dest           -> ["MOVE OR", destToString dest]
  AFlip i dest         -> ["FLIP", show i, "OR", destToString dest]
  AGoto l              -> ["GOTO", l]
  ANop                 -> ["NOP"]

destToString :: ADest -> String
destToString d = case d of
  ALabel    l -> "GOTO " ++ l
  ARelative i -> "JUMP " ++ show i

instance Show Assembler where
  show = assemblerToString

