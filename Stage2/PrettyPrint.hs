module Stage2.PrettyPrint (
    assemblerToString,
    instructionToString,
    destToString,
    instructionToString2
) where

import Data.Char (toUpper)

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..))
import Common.Simulator (LeftOrRight(..), Instruction(..), Condition(..))

assemblerToString :: Assembler -> String
assemblerToString = ats . aInstrs
  where ats [] = []
        ats ((ll,i):as) =
          (unlines $ map (++ ":") ll ++ ["    " ++ instructionToString i])
                                     ++ ats as

instructionToString :: AInstruction -> String
instructionToString i = map toUpper . unwords $ case i of
  ASense dir cond dest -> ["SENSE", show dir, condToString cond,
                           "OR", destToString dest]
  AMark num            -> ["MARK", show num]
  AUnmark num          -> ["UNMARK", show num]
  APickUp dest         -> ["PICKUP OR", destToString dest]
  ADrop                -> ["DROP"]
  ATurn turn           -> ["TURN", dirToString turn]
  AMove dest           -> ["MOVE OR", destToString dest]
  AFlip i dest         -> ["FLIP", show i, "OR", destToString dest]
  AGoto l              -> ["GOTO", l]
  AJump z              -> ["JUMP", show z]
  ANop                 -> ["NOP"]

instructionToString2 :: Instruction -> String
instructionToString2 (Turn IsLeft state) = "Turn Left " ++ show state
instructionToString2 (Turn IsRight state) = "Turn Right " ++ show state
instructionToString2 (Sense dir s1 s2 c) = "Sense " ++ show dir ++ " " ++ show s1 ++ " " ++ show s2 ++ " " ++ condToString c
instructionToString2 instruction = show instruction

condToString (Marker num) = "Marker " ++ show num
condToString c = show c

dirToString IsLeft = "LEFT"
dirToString IsRight = "RIGHT"

destToString :: ADest -> String
destToString d = case d of
  ALabel    l -> "GOTO " ++ l
  ARelative i -> "JUMP " ++ show i

instance Show Assembler where
  show = assemblerToString

