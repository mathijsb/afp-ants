module Stage2.Base (
    -- * Assembler for Ambiants
    
    -- $lang
    
    -- * Datatypes
    AInstruction(..),
    ADest(..),
    Assembler(..),
    Label
) where

import Common.Simulator (SenseDir, LeftOrRight, Condition, MarkerNumber)

{- $lang

Simple linearized Ant assembler language. All instruction implicitly continue to
the next line, except for when they fail (if applicable), where they continue to
the alternative destination given.

All instructions take 1 round to execute, except for MOVE (which takes 15 (or 16? TODO)) and the GOTO\/JUMP pseudo-instructions (which take 0).

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
   | ANop
 deriving Show

type Label = String
data ADest = ALabel Label | ARelative Int
  deriving Show
newtype Assembler = Assembler { aInstrs :: [([Label], AInstruction)] }

