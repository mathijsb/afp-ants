{-# LANGUAGE RankNTypes, ImpredicativeTypes #-}

module Stage2.Parse (
    parseAssembler,
    isInteger
) where

import Data.Char (toUpper, isDigit)
import Data.Monoid (mempty)
import Data.Map (Map)
import qualified Data.Map as M

import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..),
                         MarkerNumber)

import Stage2.Base

type Throw = forall b. String -> String -> b
type Yield b = AInstruction -> b
type InstrParser = Throw
                  -> Yield [([String], AInstruction)]
                  -> [String]
                  -> [([String], AInstruction)]
type Reader a b = Throw -> a -> b


parseAssembler :: String -> Assembler
parseAssembler = Assembler
               . foldr parse []
               . zip [1..]               -- Add line numbers for reference
               . map (takeWhile (/=';')) -- Remove comments
               . lines                   -- Newlines separate instructions
               . map toUpper             -- Case insensitivity
  where parse :: (Int, String) -> [([String], AInstruction)]
              -> [([String], AInstruction)]
        parse (n, instr) instrs = 
          case words instr of
            (w : ws) ->
              case M.lookup w instrMap of
                Just f -> f throw yield ws
                _      -> parseLabel throw put w

            [] -> instrs

          where
            -- Found instruction, append and continue parsing.
            yield i = i `seq` (([], i) : instrs)
            put l = l `seq` case instrs of
                              (ll, ii):is -> ((l : ll, ii) : is)
            -- Throw an error with a more or less helpful error message.
            throw near msg =
              let near' = if null near then instr else near
              in error $ "Parse error at line " ++ show n ++ ": " 
                             ++ msg ++ " near `" ++ near' ++ "'."

-- #########################################################################
--                            Parameter readers
-- #########################################################################
            
-- <alt>
readAlt :: Reader [String] ADest
readAlt throw s =
  case s of
    ("OR" : dest) -> readDest throw dest
    _             -> throw (sHead s) "expected `OR'"

-- <dest>
readDest :: Reader [String] ADest
readDest throw s =
  case s of
    ["JUMP", n] -> ARelative (readZ throw n)
    ["GOTO", l] -> ALabel (readLabel throw l)
    _           -> throw (sHead s) "expected `JUMP' or `GOTO'"

-- <sense>
readSense :: Reader String SenseDir
readSense throw s = 
  case M.lookup s senseMap of
    Just c -> c
    _      -> throw s "invalid sense direction"

-- <cond> (except for MARKER, which is handled separately)
readCond :: Reader String Condition
readCond throw s =
  case M.lookup s condMap of
    Just c -> c
    _      -> throw s "invalid condition"

-- <turn>
readTurn :: Reader String LeftOrRight
readTurn throw s = 
   case s of
      "LEFT"  -> IsLeft
      "RIGHT" -> IsRight
      _       -> throw s "invalid turn direction"

-- <mark>
readMark :: Reader String Int
readMark throw s =
  let i = readZ throw s
  in if i <= 5 && i >= 0
       then i
       else throw s "invalid marker number"

-- <p>
readP :: Reader String Int
readP throw s =
  let i = readZ throw s
  in if i > 0
       then i
       else throw s "expected a strictly positive number"

-- <z>
readZ :: Reader String Int
readZ throw s =
  if isInteger s
    then read s
    else throw s "expected a number"


-- <label>
readLabel :: Reader String String
readLabel throw s =
  if any (\x -> x `elem` s) ":; \t"
    then throw s "invalid character in label"
    else s

-- /safe/ version of 'head', returning the monoid identity on
-- empty list.
sHead [] = mempty
sHead xx = head xx

isInteger :: String -> Bool
isInteger s = let (h : t) = s
              in not (null s) && all isDigit t && (h == '-' || isDigit h)


-- #########################################################################
--                           Instruction parsers
-- #########################################################################

parseSense :: InstrParser 
parseSense throw yield ws = 
  case ws of
    -- SENSE <sense> MARKER <mark> <alt>
    (sense : "MARKER" : m : alt) -> 
      yield $ ASense (readSense throw sense) (Marker $! readMark throw m) (readAlt throw alt)
    -- SENSE <sense> <cond> <alt>
    (sense : cond : alt) -> 
      yield $ ASense (readSense throw sense) (readCond throw cond) (readAlt throw alt)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseMark :: InstrParser
parseMark throw yield ws =
  case ws of
    -- MARK <mark>
    [m] -> 
      yield $ AMark (readMark throw m)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseUnmark :: InstrParser
parseUnmark throw yield ws =
  case ws of
    -- UNMARK <mark>
    [m] -> 
      yield $ AUnmark (readMark throw m)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parsePickup :: InstrParser
parsePickup throw yield alt =
  yield $ APickUp (readAlt throw alt)

parseDrop :: InstrParser
parseDrop throw yield ws =
  case ws of
    -- DROP
    [] -> 
      yield $ ADrop
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseTurn :: InstrParser
parseTurn throw yield ws =
  case ws of
    -- TURN <turn>
    [turn] -> 
      yield $ ATurn (readTurn throw turn)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseMove :: InstrParser
parseMove throw yield alt =
  yield $ AMove (readAlt throw alt)

parseFlip :: InstrParser
parseFlip throw yield ws =
  case ws of
    -- FLIP <p> <alt>
    (p : alt) -> 
      yield $ AFlip (readP throw p) (readAlt throw alt)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseGoto :: InstrParser
parseGoto throw yield ws =
  case ws of
    -- GOTO <label>
    [label] ->
      yield $ AGoto (readLabel throw label)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseJump :: InstrParser
parseJump throw yield ws =
  case ws of
    -- JUMP <z>
    [z] ->
      yield $ AJump (readZ throw z)
    -- Illegal syntax
    _ -> throw (sHead ws) "syntax error"

parseNop :: InstrParser
parseNop throw yield ws =
  case ws of
    -- NOP
    [] ->
      yield $ ANop

-- <label>:
parseLabel throw put label =
  case reverse label of
    -- A valid label: attack the label to the next instruction.
    (':' : rlab@(_:_)) -> put $ reverse rlab
    (':' : _)          -> throw label "label expected"
    _                  -> throw label "label expected, missing `:'"


-- #########################################################################
--                              Parser mappings
-- #########################################################################

instrMap :: Map String InstrParser
instrMap = M.fromList [
    ("SENSE" , parseSense),
    ("MARK"  , parseMark),
    ("UNMARK", parseUnmark),
    ("PICKUP", parsePickup),
    ("DROP"  , parseDrop),
    ("TURN"  , parseTurn),
    ("MOVE"  , parseMove),
    ("FLIP"  , parseFlip),
    ("GOTO"  , parseGoto),
    ("JUMP"  , parseJump),
    ("NOP"   , parseNop)]

senseMap :: Map String SenseDir
senseMap = M.fromList [
    ("HERE"       , Here),
    ("AHEAD"      , Ahead),
    ("LEFTAHEAD"  , LeftAhead),
    ("RIGHTAHEAD" , RightAhead)]

condMap :: Map String Condition
condMap = M.fromList [
    ("FRIEND"         , Friend),
    ("FOE"            , Foe),
    ("FRIENDWITHFOOD" , FriendWithFood),
    ("FOEWITHFOOD"    , FoeWithFood),
    ("FOOD"           , Food),
    ("ROCK"           , Rock),
    ("FOEMARKER"      , FoeMarker),
    ("HOME"           , Home),
    ("FOEHOME"        , FoeHome)]

