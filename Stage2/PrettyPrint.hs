-- | Pretty printer for the AFA and native Ant languages.

module Stage2.PrettyPrint (
    assemblerToString,
    instructionToString,
    destToString,
    Ant(..),
    antInstructionToString
) where

import Data.Char (toUpper)

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..))
import Common.Simulator (LeftOrRight(..), Instruction(..), Condition(..))

-- | Shows an assembler program such that it is valid in the AFA language.
assemblerToString :: Assembler -> String
assemblerToString = concatMap ats . aInstrs
  where ats (ll,i) =
          (unlines $ map (++ ":") ll ++ ["    " ++ instructionToString i])

-- | Shows an assembler instruction such that it is valid in the AFA language.
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

-- | Shows a turn direction such that it is valid in the AFA language.
dirToString IsLeft = "LEFT"
dirToString IsRight = "RIGHT"

-- | Shows a destination such that it is valid in the AFA language.
destToString :: ADest -> String
destToString d = case d of
  ALabel    l -> "GOTO " ++ l
  ARelative i -> "JUMP " ++ show i

-- | Pretty printing 'Show' instance for assembler instructions.
instance Show Assembler where
  show = assemblerToString

-- | Wrapper for native Ant instructions that allows easy showing.
newtype Ant = Ant [Instruction]

-- | Pretty printing 'Show' instance for native ants.
instance Show Ant where
  show (Ant is) = unlines $ map antInstructionToString is

-- | Shows a native Ant instruction such that it is valid in the Ant language.
antInstructionToString :: Instruction -> String
antInstructionToString (Turn IsLeft state) = "Turn Left " ++ show state
antInstructionToString (Turn IsRight state) = "Turn Right " ++ show state
antInstructionToString (Sense dir s1 s2 c) = "Sense " ++ show dir ++ " "
                   ++ show s1 ++ " " ++ show s2 ++ " " ++ condToString c
antInstructionToString instruction = show instruction

-- | Shows an Ant condition such that it is valid in the Ant language.
condToString (Marker num) = "Marker " ++ show num
condToString c = show c

