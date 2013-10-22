module Stage2.AntAssembler (
    parseAssembler,
    assemblerToString,
    assemble,
    AInstruction (..),
    ADest (..),
    Assembler
) where

import Data.Char (toUpper, isDigit)
import Data.Map (Map)
import qualified Data.Map as M
import Data.Set (Set)
import qualified Data.Set as S
import Common.Simulator

{-

Simple linearized Ant assembler language. All instruction implicitly continue to
the next line, except for when they fail (if applicable), where they continue to
the alternative destination given.

All instructions take 1 round to execute, except for MOVE (which takes 15 (or 16? TODO)) and the GOTO/JUMP pseudo-instructions (which take 0).

Labels are case-insensitive.

<line>  := <asm>
         | <asm> ; .*       -- Assembler line with comment.

<asm>   := <label>:
         | <instr>

<label> := [^ ;:]+          -- All characters except for whitespace, colon and semi-colon.

<instr> := SENSE <dir> <cond> OR <dest>
         | PICKUP OR <dest>
         | MOVE OR <dest>
         | FLIP <n> OR <dest>
         | MARK <mark>
         | UNMARK <mark>
         | DROP
         | TURN <leftright>
         | GOTO <label>      -- Pseudo-instruction for jumping to a label
         | NOP               -- Explicitly do nothing for one round (shorthand for FLIP 1 OR JUMP 1)
         
<dir>   := LEFTAHEAD
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

<dest>  := JUMP <z>     -- Jump relative to the current instruction
         | GOTO <label> -- Jump to given label

<mark>  := 0 | 1 | 2 | 3 | 4 | 5
<n>     := 1 | 2 | ...
<z>     := ... | -1 | 0 | 1 | ...

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
   | AGoto ALabel
   | ANop
 deriving Show

type ALabel = String
data ADest = ALabel ALabel | ARelative Int
  deriving Show
type Assembler = [([ALabel], AInstruction)]
type Comment = String

assemblerToString :: Assembler -> String
assemblerToString []          = ""
assemblerToString ((ll,i):as) = (unlines $ map (++ ":") ll ++
                                           ["    " ++ instructionToString i])
                                ++ assemblerToString as

instructionToString :: AInstruction -> String
instructionToString i = map toUpper . unwords $ case i of
  ASense dir cond dest -> ["SENSE", show dir, show cond, "OR", destToString dest]
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

test :: Assembler
test = [
    (["start"], ATurn IsLeft),
    ([]       , ATurn IsLeft),
    ([]       , AMove (ARelative 6)),
    ([]       , AGoto "start"),
    (["error"], ANop),
    ([]       , AGoto "error"),
    (["error3"], AGoto "error2"),
    (["error2"], AGoto "error"),
    (["error4"], AGoto "error3")
  ]


-- Simple test for GOTO cycle detection. This test should succeed right now.
testInf :: Assembler
testInf = [(["start"], ANop), (["end1"], AGoto "end2"), (["end2"], AGoto "end1")]

-- TODO: check for uniqueness of labels. This test fails right now (by not throwing an error).
testDup :: Assembler
testDup = [(["start"], ANop), (["start"], ANop)]

-- TODO: use M.lookup with proper error handling instead of using M.!
assemble :: Assembler -> [(Instruction, Comment)]
assemble as = snd $ assemble' M.empty 0 ins
  where ins = map (\(n, (ls, i)) -> (n, ls, i)) . zip [1..] $ as
        lmap :: Map ALabel Int
        lmap = M.fromList $ concatMap (\(n, ls, _) -> zip ls $ repeat n) ins
        imap :: Map Int AInstruction
        imap = M.fromList $ map (\(n, _, i) -> (n, i)) ins
        assemble' :: Map Int Int -> Int -> [(Int, [ALabel], AInstruction)] -> (Map Int Int, [(Instruction, Comment)])
        assemble' m _ [] = (m, [])
        assemble' m x ((n, ls, i):as) = case i of
            ASense dir cond dest -> yield $ Sense dir next (pos dest) cond
            AMark num            -> yield $ Mark num next
            AUnmark num          -> yield $ Unmark num next
            APickUp dest         -> yield $ PickUp next (pos dest)
            ADrop                -> yield $ Drop next
            ATurn lr             -> yield $ Turn lr next
            AMove dest           -> yield $ Move next (pos dest)
            AFlip ii dest        -> yield $ Flip ii next (pos dest)
            ANop                 -> yield $ Flip 1 next next
            AGoto l -> if isCyclic l 
                         then error $ "Cyclic GOTO at " ++ show n ++ ": " ++ instructionToString i
                         else let (m'', is') = assemble' (M.insert n (m'' M.! (lmap M.! l)) m) x as in (m'', is')
            
          where yield x = (m', (x, comm) : is)
                (m', is) = assemble' (M.insert n x m) (x+1) as
                ref (ALabel l)    = lmap M.! l
                ref (ARelative r) = n + r
                pos x = m' M.! (ref x)
                next = pos (ARelative 1)
                comm = show n ++ ". " ++ instructionToString i
                isCyclic :: ALabel -> Bool
                isCyclic l = isCyclic' $ fetch l
                  where isCyclic' i = case i of
                                         AGoto l' -> l' == l || isCyclic' (fetch l')
                                         _        -> False
                        fetch = (M.!) imap . (M.!) lmap

{-
readAssembler :: String -> IO Assembler
readAssembler asmFile = 
   do input <- readFile asmFile
      let list = map (fst . stringToInstruction) (lines (map toUpper input))
          len  = length list
      arr <- newListArray (0, len-1) list
      if len > 10000
        then error ("Too many states: " ++ show antFile)
        else return arr
-}
      
parseAssembler :: String -> Assembler
parseAssembler = parse [] . zip [1..] . map (takeWhile (/=';')) . lines . map toUpper
  where parse _ [] = []
        parse ls ((n, instr) : instrs) =
          case words instr of
             ("SENSE" : sense : "MARKER" : m : alt) -> 
                yield $ ASense (readSense sense) (Marker (readMark m)) (readAlt alt)
             ("SENSE" : sense : cond : alt) -> 
                yield $ ASense (readSense sense) (readCond cond) (readAlt alt)
             ["MARK", m] -> 
                yield $ AMark (readMark m)
             ["UNMARK", m] -> 
                yield $ AUnmark (readMark m)
             ("PICKUP" : alt) -> 
                yield $ APickUp (readAlt alt)
             ["DROP"] -> 
                yield $ ADrop
             ["TURN", turn] -> 
                yield $ ATurn (readTurn turn)
             ("MOVE" : alt) -> 
                yield $ AMove (readAlt alt)
             ("FLIP" : p : alt) -> 
                yield $ AFlip (readNum p) (readAlt alt)
             ["GOTO", label] ->
                yield $ AGoto (readLabel label)
             ["NOP"] ->
                yield $ ANop
             [label] -> case reverse label of
                          (':' : rlab@(_:_)) -> parse (reverse rlab : ls) instrs
                          (':' : _)          -> throw label "label expected"
                          _                  -> throw label "label expected, missing `:'"
             []      -> parse ls instrs
             _       -> throw "" "invalid instruction" 
          where
            yield i = (reverse ls, i) : parse [] instrs
            throw near msg = let near' = if null near then instr else near
                             in error $ "Parse error at line " ++ show n ++ ": " 
                                  ++ msg ++ " near `" ++ near' ++ "'."
            
            readAlt s = case s of
                          ("OR" : dest) -> readDest dest
                          _             -> throw (sHead s) "expected `OR'"
            
            readDest s = case s of
                           ["JUMP", n] -> ARelative (readNum n)
                           ["GOTO", l] -> ALabel (readLabel l)
                           _           -> throw (sHead s) "expected `JUMP' or `GOTO'"
            
            readSense s = 
               case s of 
                  "HERE"       -> Here
                  "AHEAD"      -> Ahead
                  "LEFTAHEAD"  -> LeftAhead
                  "RIGHTAHEAD" -> RightAhead
                  _            -> throw s "invalid sense direction"
                  
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

            readTurn s = 
               case s of
                  "LEFT"  -> IsLeft
                  "RIGHT" -> IsRight
                  _       -> throw s "invalid turn direction"
                  
            readMark s = let i = readNum s
                         in if i > 5
                              then i
                              else throw s "invalid marker number"
            readNum s  = if isNum s
                           then read s
                           else throw s "expected a number"
            
            readLabel s = if any (\x -> x `elem` ":; \t") s
                            then throw s "invalid character in label"
                            else s
            sHead [] = ""
            sHead xx = head xx
    
isNum :: String -> Bool
isNum s = let (h : t) = s
          in not (null s) && all isDigit t && (h == '-' || isDigit h)
