module Stage2.Assembler (
    assemble,
    assembleWithInfo
) where

import Data.Map (Map)
import qualified Data.Map as M
import Data.Set (Set)
import qualified Data.Set as S

import Stage2.Base (AInstruction(..), ADest(..), Assembler(..), Label)
import Stage2.PrettyPrint (instructionToString)

import Common.Simulator (Instruction(..))

-- Some types, just for clarity of the code.
type Info = String
type InputInstr = Int
type OutputInstr = Int
type Labels = [Label]
type AnnotatedInstructions = [(Instruction, Info)]


assemble :: Assembler -> [Instruction]
assemble = map fst . assembleWithInfo

-- TODO: use M.lookup with proper error handling instead of using M.!
assembleWithInfo :: Assembler -> AnnotatedInstructions
assembleWithInfo as = snd $ assemble' M.empty 0 ins
  where -- Input instructions with their labels and input instruction numbers.
        ins :: [(InputInstr, Labels, AInstruction)]
        ins = map (\(n, (ls, i)) -> (n, ls, i)) . zip [1..] . aInstrs $ as

        -- Mapping of labels to the instruction number they originated from.
        lmap :: Map Label InputInstr
        lmap = M.fromList $ concatMap (\(n, ls, _) -> zip ls $ repeat n) ins

        -- Mapping of input instruction numbers to their assembler instructions.
        imap :: Map InputInstr AInstruction
        imap = M.fromList $ map (\(n, _, i) -> (n, i)) ins
        
        -- Recursively yield assembled instructions and update the input/output
        -- mapping.
        assemble' :: Map InputInstr OutputInstr -> OutputInstr
                  -> [(InputInstr, Labels, AInstruction)]
                  -> (Map InputInstr OutputInstr, AnnotatedInstructions)
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
                isCyclic :: Label -> Bool
                isCyclic l = isCyclic' $ fetch l
                  where isCyclic' i = case i of
                                         AGoto l' -> l' == l || isCyclic' (fetch l')
                                         _        -> False
                        fetch = (M.!) imap . (M.!) lmap

