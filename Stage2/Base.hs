{-# LANGUAGE DeriveDataTypeable #-}

-- | Language and datatype definitions for the /Assembler for Ambiants/ (AFA) Assembler.

module Stage2.Base (
    -- * Assembler for Ambiants
    
    -- $lang
    
    -- * Datatypes
    AInstruction(..),
    ADest(..),
    Assembler(..),
    Label,
    AssemblerException(..)
) where

import Control.DeepSeq (NFData(..))
import Data.IntMap (IntMap)
import Control.Exception
import Control.Monad.Error
import Data.Typeable

import Common.Simulator (SenseDir, LeftOrRight, Condition(Marker), MarkerNumber)

{- $lang

Simple linearized Ant assembler language. All instruction implicitly continue to
the next line, except for when they fail (if applicable), where they continue to
the alternative destination given.

All instructions take 1 round to execute, except for MOVE (which takes 16) and
the GOTO\/JUMP pseudo-instructions (which take 0).

Instructions and all labels are considered case-insensitive.

@
<line>  := <asm>
         | <asm> ; .*       -- Assembler line with comment.

<asm>   := <label>:
         | <instr>

<label> := [^ ;:]+          -- All characters except for whitespace, colon and semi-colon.

<instr> := SENSE <sense> <cond> <alt>
         | PICKUP <alt>
         | MOVE <alt>
         | FLIP <p> <alt>
         | MARK <mark>
         | UNMARK <mark>
         | DROP
         | TURN <turn>
         | GOTO <label>      -- Pseudo-instruction for jumping to a label
         | JUMP <z>          -- Pseudo-instruction for jumping <z> lines
         | NOP               -- Explicitly do nothing for one round (shorthand for FLIP 1 OR JUMP 1)
         
<sense> := LEFTAHEAD
         | RIGHTAHEAD
         | AHEAD
         | HERE

<turn>  := LEFT
         | RIGHT

<cond>  := FRIEND
         | FOE
         | FRIENDWITHFOOD
         | FOEWITHFOOD
         | FOOD
         | ROCK
         | FOEMARKER
         | HOME
         | FOEHOME
         | MARKER <mark>

<alt>   := OR <dest>

<dest>  := JUMP <z>     -- Jump relative to the current instruction
         | GOTO <label> -- Jump to given label

<mark>  := 0 | 1 | 2 | 3 | 4 | 5
<p>     := 1 | 2 | ...
<z>     := ... | -1 | 0 | 1 | ...
@

-}

-- | Trivial instruction datatype for the assembler.
data AInstruction 
   = ASense SenseDir Condition ADest
   | AMark MarkerNumber
   | AUnmark MarkerNumber
   | APickUp ADest
   | ADrop
   | ATurn LeftOrRight
   | AMove ADest
   | AFlip Int ADest
   | AGoto Label
   | AJump Int
   | ANop
   | ALabel1 String -- Used only in Stage1, probably needs to be refactored...
 deriving Show

type Label = String

-- | Destination in the assembler code.
data ADest = ALabel Label  -- ^ Destination labeled by a label.
           | ARelative Int -- ^ Destination relative to the current position
                           -- (e.g. @ARelative 0@ equals the current position).
  deriving (Show, Eq)

-- | Wrapper for assembler code, which might include a mapping from instruction
-- number to input line number for debugging purposes.
data Assembler = Assembler { aInstrs :: [([Label], AInstruction)],
                             aLineMap :: Maybe (IntMap Int) }

-- | Exceptions that can be thrown by the parser or validator. They always
-- mention a line number, which corresponds to the (1-based) input line
-- of the parser or is 0 when unknown (which might occur if there is no
-- line-to-instruction mapping available).
--
-- Note that the assembler itself will never throw an exception; it will never
-- fail if its input passes the validation.
data AssemblerException = ParseException {
                            eLine :: Int,
                            eMsg :: String,
                            eNear :: String,
                            ePInstr :: String }
                        | ValidationException {
                            eLine :: Int,
                            eMsg :: String }
  deriving (Typeable)

instance Show AssemblerException where
  show (ParseException n msg near instr) = 
    let near' = if null near then instr else near in
    "Parse error at line " ++ show n ++ ": " 
       ++ msg ++ " near `" ++ near' ++ "'."
  show (ValidationException n m) = 
    "Assembler validation failed: " ++ m
instance Exception AssemblerException
instance Error AssemblerException

instance NFData AInstruction where
  rnf i = case i of
    ASense s c d -> s `seq` (rnf (c, d))
    AMark m      -> m `seq` ()
    AUnmark m    -> m `seq` ()
    APickUp d    -> rnf d
    ATurn lr     -> lr `seq` ()
    AMove d      -> rnf d
    AFlip p d    -> rnf (p, d)
    AGoto l      -> rnf l
    AJump z      -> rnf z
    _ -> ()

instance NFData Condition where
  rnf (Marker m) = rnf m
  rnf c          = c `seq` ()

instance NFData Assembler where
  rnf (Assembler a l) = rnf (a, l)

instance NFData ADest where
  rnf (ALabel l)    = rnf l
  rnf (ARelative z) = rnf z

