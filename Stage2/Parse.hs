module Stage2.Parse (
    parseAssembler,
    isInteger
) where

import Data.Char (toUpper, isDigit)
import Data.Monoid (mempty)

import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber)

import Stage2.Base

parseAssembler :: String -> Assembler
parseAssembler = Assembler
               . parse []
               . zip [1..]               -- Add line numbers for reference
               . map (takeWhile (/=';')) -- Remove comments
               . lines                   -- Newlines separate instructions
               . map toUpper             -- Case insensitivity
  where parse _ [] = []
        parse ls ((n, instr) : instrs) =
          case words instr of
             -- SENSE <sense> MARKER <mark> <alt>
             ("SENSE" : sense : "MARKER" : m : alt) -> 
               yield $ ASense (readSense sense) (Marker (readMark m)) (readAlt alt)

             -- SENSE <sense> <cond> <alt>
             ("SENSE" : sense : cond : alt) -> 
               yield $ ASense (readSense sense) (readCond cond) (readAlt alt)

             -- MARK <mark>
             ["MARK", m] -> 
               yield $ AMark (readMark m)

             -- UNMARK <mark>
             ["UNMARK", m] -> 
               yield $ AUnmark (readMark m)

             -- PICKUP <alt>
             ("PICKUP" : alt) -> 
               yield $ APickUp (readAlt alt)

             -- DROP
             ["DROP"] -> 
               yield $ ADrop

             -- TURN <turn>
             ["TURN", turn] -> 
               yield $ ATurn (readTurn turn)

             -- MOVE <alt>
             ("MOVE" : alt) -> 
               yield $ AMove (readAlt alt)

             -- FLIP <p> <alt>
             ("FLIP" : p : alt) -> 
               yield $ AFlip (readP p) (readAlt alt)

             -- GOTO <label>
             ["GOTO", label] ->
               yield $ AGoto (readLabel label)

             -- NOP
             ["NOP"] ->
               yield $ ANop

             -- <label>:
             [label] ->
               case reverse label of
                 -- A valid label: attack the label to the next instruction.
                 (':' : rlab@(_:_)) -> parse (reverse rlab : ls) instrs
                 (':' : _)          -> throw label "label expected"
                 _                  -> throw label "label expected, missing `:'"
             -- Empty lines (or just comments) are ignored.
             [] ->
               parse ls instrs
             -- Anything else is invalid.
             _ ->
               throw "" "invalid instruction" 
          where
            -- Found instruction, append and continue parsing.
            yield i = (reverse ls, i) : parse [] instrs
            
            -- Throw an error with a more or less helpful error message.
            throw near msg =
              let near' = if null near then instr else near
              in error $ "Parse error at line " ++ show n ++ ": " 
                             ++ msg ++ " near `" ++ near' ++ "'."
            
            -- <alt>
            readAlt s =
              case s of
                ("OR" : dest) -> readDest dest
                _             -> throw (sHead s) "expected `OR'"
            
            -- <dest>
            readDest s =
              case s of
                ["JUMP", n] -> ARelative (readZ n)
                ["GOTO", l] -> ALabel (readLabel l)
                _           -> throw (sHead s) "expected `JUMP' or `GOTO'"
            
            -- <sense>
            readSense s = 
               case s of 
                  "HERE"       -> Here
                  "AHEAD"      -> Ahead
                  "LEFTAHEAD"  -> LeftAhead
                  "RIGHTAHEAD" -> RightAhead
                  _            -> throw s "invalid sense direction"
            
            -- <cond> (except for MARKER, which is handled separately)
            readCond s =
               case s of
                  "FRIEND"         -> Friend
                  "FOE"            -> Foe
                  "FRIENDWITHFOOD" -> FriendWithFood
                  "FOEWITHFOOD"    -> FoeWithFood
                  "FOOD"           -> Food
                  "ROCK"           -> Rock
                  "FOEMARKER"      -> FoeMarker
                  "HOME"           -> Home
                  "FOEHOME"        -> FoeHome
                  _                -> throw s "invalid condition"
            
            -- <turn>
            readTurn s = 
               case s of
                  "LEFT"  -> IsLeft
                  "RIGHT" -> IsRight
                  _       -> throw s "invalid turn direction"
            
            -- <mark>
            readMark s = let i = readZ s
                         in if i > 5
                              then i
                              else throw s "invalid marker number"
            
            -- <p>
            readP s = let i = readZ s
                      in if i > 0
                           then i
                           else throw s "expected a strictly positive number"
            
            -- <z>
            readZ s = if isInteger s
                        then read s
                        else throw s "expected a number"
            
            
            -- <label>
            readLabel s = if any (\x -> x `elem` ":; \t") s
                            then throw s "invalid character in label"
                            else s
            
            -- /safe/ version of 'head', returning the monoid identity on
            -- empty list.
            sHead [] = mempty
            sHead xx = head xx
    
isInteger :: String -> Bool
isInteger s = let (h : t) = s
              in not (null s) && all isDigit t && (h == '-' || isDigit h)
