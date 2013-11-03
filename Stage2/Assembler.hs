{-# LANGUAGE FlexibleContexts #-}

-- | Assembler for the /Assembler for Ambiants/ (AFA) language.
--
-- See module "Stage2.Base" for a specification of the AFA language.
--

module Stage2.Assembler (
    assemble,
    assembleWithInfo,
    ValidAssembler(assembler),
    validate,
    unsafeMarkValid
) where

import Data.HashMap.Lazy (HashMap)
import qualified Data.HashMap.Lazy as HM
import Data.Array (Array)
import qualified Data.Array as A
import qualified Data.IntMap as IM
import qualified Data.IntMap.Strict as IMS
import Data.IntSet (IntSet)
import qualified Data.IntSet as IS
import Data.Maybe
import Data.List

import Control.Monad.Error (MonadError, throwError, unless)
import Control.DeepSeq (NFData(..))

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..), Label,
                    AssemblerException(ValidationException))
import Stage2.PrettyPrint (instructionToString)

import Common.Simulator (Instruction(..))

-- Some types, just for clarity of the code.
type InputInstr = Int
type OutputInstr = Int
type GotoMap = IMS.IntMap Int
type InOutMap = IM.IntMap Int
type Labels = [Label]

type Validator = Assembler -> Either AssemblerException ()

-- | Wrapper for validated assembler code.
data ValidAssembler = Valid { assembler :: Assembler }

instance NFData ValidAssembler where
  rnf (Valid a) = rnf a

-- | Assembles the validated assembler program, yielding a native Ant program.
assemble :: ValidAssembler -> [Instruction]
assemble = snd . assembleWithInfo

-- | Creates a mapping of labels to their corresponding input instruction
--  numbers for the given assembler program.
aLabels :: Assembler -> HashMap Label InputInstr
aLabels = HM.fromList . concatMap extractLabels . zip [1..] . map fst . aInstrs
  where extractLabels (n, ls) = zip ls $ repeat n

-- | Creates a mapping of input instruction numbers to assembler instructions
-- for the given assembler program.
aLines :: Assembler -> Array InputInstr AInstruction
aLines as = let ass = aInstrs as
            in A.array (1, length ass) . zip [1..] . map snd $ ass

-- | Maps goto-like instructions in the assembler language to their /final/ 
-- destinations (after traversing subsequent gotos) by instruction numbers.
aGotoMap :: Assembler -> GotoMap
aGotoMap as = simplify . IMS.fromList . mapMaybe edge $ A.assocs lines
  where labels = aLabels as
        lines  = aLines as
        edge :: (InputInstr, AInstruction) -> Maybe (InputInstr, InputInstr)
        edge (n, i) = case i of
                        AJump i -> Just (n, n + i)
                        AGoto l -> case HM.lookup l labels of
                                     Just d -> Just (n, d)
                                     _      -> Nothing
                        _       -> Nothing
        simplify m = IMS.mapWithKey (\x -> simplify' (IS.fromList [x]) x) m
          where simplify' v from to =
                  if IS.member to v
                    then to
                    else case IMS.lookup to m of
                           Just n  -> simplify' (IS.insert to v) from n
                           Nothing -> to

-- | Assembler-specific 'throwError' function piggy-backed on 'validationError',
-- which provides a simple means to display errors related to an instruction.
validationInstrError :: MonadError AssemblerException m => String -> Assembler
                     -> InputInstr -> m a
validationInstrError m as n = validationError (instrLineNumber as n) $
  m ++ ", at instruction " ++ show n ++ ": " ++
  instructionToString (aLines as A.! n)

-- | Assembler-specific 'throwError' function.
validationError :: MonadError AssemblerException m => Int -> String -> m a
validationError n m = throwError $ ValidationException n m

-- | Returns the line number (1-based) of the given instruction number in the
-- input, or 0 if unknown.
instrLineNumber :: Assembler -> InputInstr -> Int
instrLineNumber as n =
    case aLineMap as of
      Just m -> case IM.lookup n m of
                  Just i  -> i
                  Nothing -> 0
      Nothing -> 0

-- | Gives the possible (relative) destinations for the continuation of the 
-- program for the given instruction.
instrDest :: AInstruction -> [ADest]
instrDest i = case i of
    ASense _ _ dest -> [ARelative 1, dest]
    AMark _         -> [ARelative 1]
    AUnmark _       -> [ARelative 1]
    APickUp dest    -> [ARelative 1, dest]
    ADrop           -> [ARelative 1]
    ATurn _         -> [ARelative 1]
    AMove dest      -> [ARelative 1, dest]
    AFlip _ dest    -> [ARelative 1, dest]
    ANop            -> [ARelative 1]
    AGoto l         -> [ALabel l]
    AJump z         -> [ARelative z]

-- | Checks if all destinations referred to by JUMP or GOTO (as argument of
-- an instruction or as separate instructions) are valid destinations in the
-- program (e.g. not out of bounds, existing labels).
validateDestinations :: Validator
validateDestinations as =
    do mapM_ validDest $ A.assocs lines
       return ()
  where is = aInstrs as
        labels = aLabels as
        lines = aLines as
        inBounds x = x >= fst (A.bounds lines) && x <= snd (A.bounds lines)
        validDest (n, i) =
            do bs <- mapM rel (instrDest i)
               unless (all inBounds bs) $
                 validationInstrError "invalid destination" as n
          where rel (ARelative z) = return $ n + z
                rel (ALabel l) =
                  case HM.lookup l labels of
                    Just n -> return n
                    Nothing ->
                      validationInstrError ("unknown label `" ++ l ++ "'") as n

-- | Checks if the GOTO \/ JUMP sequences do not contain non-productive cycles.
validateCycleFree :: Validator
validateCycleFree as = unless (null cyclics) $
    validationInstrError "cycle detected" as (snd $ head cyclics)
  where cyclics = dropWhile (uncurry (/=)) . IMS.assocs $ aGotoMap as

-- | Checks if there are no duplicate labels in the program.
validateUniqueLabels :: Validator
validateUniqueLabels as = unless (null duplicates) $
    validationError n $ "duplicate label: " ++ (intercalate ", " duplicates)
  where duplicates = map head . filter (\x -> length x > 1) . group . sort
                   . concatMap fst $ instrs
        instrs = aInstrs as
        n = instrLineNumber as . fst . head
          . filter (any (`elem` duplicates) . snd) . zip [1..] $ map fst instrs

-- | Steps to validate assembler programs such that when all steps succeed,
-- the assembler will successfully assemble the program.
validators :: [Validator]
validators = [validateUniqueLabels,
              validateCycleFree,
              validateDestinations]

-- | Validates the given assembler code for properties assumed by the assembler,
-- such as being free of non-productive loops that cannot be translated.
validate :: Assembler -> Either AssemblerException ValidAssembler
validate as = do mapM_ ($ as) validators
                 return $ Valid as

-- | Marks arbitrary assembler code as valid. Assembling such code could result
-- in diverging behaviour, incorrect output or crashes. Caveat emptor. 
unsafeMarkValid :: Assembler -> ValidAssembler
unsafeMarkValid = Valid

-- | Assembles the given assembler code and outputs the resulting instructions,
-- as well as a mapping from input instruction numbers (1-based) to output lines
-- (0-based).
--
-- Note that the instruction number /do not/ match the original line numbers:
-- use the line map generated by the parser to match the two.
assembleWithInfo :: ValidAssembler -> (InOutMap, [Instruction])
assembleWithInfo vas = assemble' IM.empty 0 ins
  where as = assembler vas
        numI = length $ aInstrs as
        -- Input instructions with their labels and input instruction numbers.
        ins :: [(InputInstr, Labels, AInstruction)]
        ins = map (\(n, (ls, i)) -> (n, ls, i)) . zip [1..] . aInstrs $ as

        -- Mapping of labels to the instruction number they originated from.
        -- Assumption: there are no duplicate labels.
        lmap = aLabels as
        
        -- Recursively yield assembled instructions and update the input/output
        -- mapping.
        assemble' :: InOutMap -> OutputInstr
                  -> [(InputInstr, Labels, AInstruction)]
                  -> (InOutMap, [Instruction])
        assemble' m _ [] = (m, [])
        assemble' m x ((n, ls, i):as) = case i of
            ASense dir cond dest -> yield   $ Sense dir next (pos dest) cond
            AMark num            -> yield   $ Mark num next
            AUnmark num          -> yield   $ Unmark num next
            APickUp dest         -> yield   $ PickUp next (pos dest)
            ADrop                -> yield   $ Drop next
            ATurn lr             -> yield   $ Turn lr next
            AMove dest           -> yield   $ Move next (pos dest)
            AFlip ii dest        -> yield   $ Flip ii next (pos dest)
            ANop                 -> yield   $ Flip 1 next next
            AGoto l              -> recurse $ ALabel l
            AJump z              -> recurse $ ARelative z
            
          where -- Yield an instruction, and continue assembling the remaining
                -- instructions.
                yield x = is `seq` (m', x : is)
                -- Do not yield an instruction, continue instead.
                recurse d = 
                  -- We need a fixpoint construction on m'' to find the
                  -- true destination line of an ADest.
                  -- Assumption: the assembler code does not contain non-
                  -- productive loops, or this will diverge.
                  let (m'', is') =
                        assemble' (IM.insert n (m'' IM.! ref d) m) x as
                  in (m'', is')
                -- The result of assembling the remaining instructions, assuming
                -- we just yielded an instruction.
                (m', is) = assemble' (IM.insert n x m) (x+1) as
                -- Lookup a destination. Assumption: the given label exists.
                ref (ALabel l)    = lmap HM.! l
                ref (ARelative r) = n + r
                -- Lookup the output line of a destination. Assumption: the
                -- destination is in bounds.
                pos x = m' IM.! ref x
                next = pos (ARelative 1)

