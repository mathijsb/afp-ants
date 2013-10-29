{-# LANGUAGE FlexibleContexts, RankNTypes, ImpredicativeTypes #-}

module Stage2.Assembler (
    assemble,
    assembleWithInfo,
    ValidAssembler(assembler),
    validate
) where

import Data.Map (Map)
import qualified Data.Map as M
import Data.Set (Set)
import qualified Data.Set as S
import Data.Array (Array)
--import qualified Data.Array as A
import qualified Data.Array.Base as A
import qualified Data.IntMap as IM
import qualified Data.IntMap.Strict as IMS
import Data.IntSet (IntSet)
import qualified Data.IntSet as IS
import Data.Maybe
import Control.Monad.Error
import Control.Monad.Identity

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..), Label)
import Stage2.PrettyPrint (instructionToString)

import Common.Simulator (Instruction(..))

-- Some types, just for clarity of the code.
type Info = String
type InputInstr = Int
type OutputInstr = Int
type Labels = [Label]

type Validator = Assembler -> Either String ()
data ValidAssembler = Valid { assembler :: Assembler }

type GotoMap = IMS.IntMap Int

assemble :: ValidAssembler -> [Instruction]
assemble = snd . assembleWithInfo

aLabels :: Assembler -> Map Label InputInstr
aLabels = M.fromList . concatMap extractLabels . zip [1..] . map fst . aInstrs
  where extractLabels (n, ls) = zip ls $ repeat n

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
                        AGoto l -> case M.lookup l labels of
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
validationInstrError :: MonadError String m => String -> Assembler -> InputInstr -> m a
validationInstrError m as n = validationError $ m ++ ", at instruction " ++
  show n ++ ": " ++ instructionToString (aLines as A.! n)

-- | Assembler-specific 'throwError' function.
validationError :: MonadError String m => String -> m a
validationError m = throwError $ "Assembler validation failed: " ++ m

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
                  case M.lookup l labels of
                    Nothing ->
                      validationInstrError ("unknown label `" ++ l ++ "'") as n
                    Just n -> return n

-- | Checks if the GOTO \/ JUMP sequences do not contain non-productive cycles.
validateCycleFree :: Validator
validateCycleFree as = do mapM_ notCyclic . IMS.assocs . aGotoMap $ as
                          return ()
  where notCyclic (from, to) = unless (from /= to) $
          validationInstrError "cycle detected" as to

-- | Checks if there are no duplicate labels in the program.
validateUniqueLabels :: Validator
validateUniqueLabels as =
  case uniq S.empty . concatMap fst . aInstrs $ as of
         Nothing -> return ()
         Just l  -> validationError $ "duplicate label " ++ l
  where uniq :: Set Label -> [Label] -> Maybe Label
        uniq _ [] = Nothing
        uniq s (x:xs) = if S.member x s
                          then Just x
                          else uniq (S.insert x s) xs

validators :: [Validator]
validators = [validateUniqueLabels,
              validateCycleFree,
              validateDestinations]

validate :: Assembler -> Either String ValidAssembler
validate as = do mapM_ ($ as) validators
                 return $ Valid as

type InOutMap = IM.IntMap Int

assembleWithInfo :: ValidAssembler -> (InOutMap, [Instruction])
assembleWithInfo vas = assemble' IM.empty 0 ins
  where as = assembler vas
        numI = length $ aInstrs as
        -- Input instructions with their labels and input instruction numbers.
        ins :: [(InputInstr, Labels, AInstruction)]
        ins = map (\(n, (ls, i)) -> (n, ls, i)) . zip [1..] . aInstrs $ as

        -- Mapping of labels to the instruction number they originated from.
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
            
          where yield x = (m', x : is)
                recurse d = 
                  let (m'', is') = assemble' (IM.insert n (m'' IM.! ref d) m) x as
                  in (m'', is')
                (m', is) = assemble' (IM.insert n x m) (x+1) as
                ref (ALabel l)    = lmap M.! l
                ref (ARelative r) = n + r
                pos x = m' IM.! ref x
                next = pos (ARelative 1)
