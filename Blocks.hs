{-# LANGUAGE RankNTypes, GADTs, StandaloneDeriving, DeriveDataTypeable #-}

module Blocks where

import Data.Typeable
import Data.Maybe

type Label = String

data In deriving Typeable
data Out deriving Typeable

type InputLine    = Line In  In
type OutputLine   = Line Out Out
type InternalLine = Line Out In



{-

       |
+------i------------+ 
|      | A          |
|      |            |
|      +--------,   |
|    +-i------+ |   |
|    |        | | C |
|    +-o---o--+ |   |
|      |   '----'   |
|      |            |
|      | B          |
+------o------------+

A: InputLine (from block-input to sub-input)
B: OutputLine (from sub-output to block-output)
C: InternalLine (from sub-output to sub-input)

-}

data Connector a = Connector { connLabel :: Label, connOwner :: Block }
  deriving Eq

instance Show (Connector a) where
  show c = "Connector " ++ connLabel c

data Line a b where
  Input    :: Connector In  -> Connector In  -> InputLine
  Output   :: Connector Out -> Connector Out -> OutputLine
  Internal :: Connector Out -> Connector In  -> InternalLine

deriving instance Typeable1 Connector
deriving instance Typeable2 Line
deriving instance Show (Line a b)

is2 :: (Typeable c, Typeable x) => (a -> b -> c) -> x -> Bool
is2 f x = case cast x of
            Just y  -> forceType (f undefined undefined) y True
            Nothing -> False

is1 :: (Typeable c, Typeable x) => (b -> c) -> x -> Bool
is1 f x = case cast x of
            Just y  -> forceType (f undefined) y True
            Nothing -> False

is0 :: (Typeable c, Typeable x) => c -> x -> Bool
is0 f x = case cast x of
            Just y  -> forceType f y True
            Nothing -> False

forceType :: a -> a -> b -> b
forceType _ _ = id

lineFrom :: Line a b -> Connector a
lineFrom c = case c of
  Input    f _ -> f
  Output   f _ -> f
  Internal f _ -> f

lineTo :: Line a b -> Connector b
lineTo c = case c of
  Input    _ t -> t
  Output   _ t -> t
  Internal _ t -> t

data AnyLine = forall a b. (Typeable a, Typeable b) => Line (Line a b)

withAnyLine :: (forall a b. (Typeable a, Typeable b) => Line a b -> c) -> AnyLine -> c
withAnyLine f (Line l) = f l

withLineEnds :: (forall a. Connector a -> c) -> Line a b -> (c, c)
withLineEnds f l = (f $ lineFrom l, f $ lineTo l)

-- TODO: make actual implementation of Code, and connector extraction from code.
--
-- for instance, a program similar to:
--
-- IN do_something
-- {
--     if (move)
--     {
--         OUT moved
--     }
--     else
--     {
--         OUT failed
--     }
-- }
--
-- would result in [Connector Out "moved", Connector Out "failed"] or similar.
newtype Code = Code [Label]
  deriving (Show, Eq)
extractConnectorOuts :: Block -> Code -> [Connector Out]
extractConnectorOuts o (Code x) = map (\l -> Connector { connLabel = l, connOwner = o }) x

data Block = GraphBlock (Connector In) [Connector Out] [Block] [AnyLine]
           | CodeBlock  (Connector In) Code

instance Eq Block where
  -- TODO: sorting order of data? For now, this works to establish physical equality.
  (==) (GraphBlock i1 o1 b1 l1) (GraphBlock i2 o2 b2 l2) =
    eqConnByLabel i1 i2 &&
    all (uncurry eqConnByLabel) (zip o1 o2) &&
    all (uncurry (==)) (zip b1 b2) &&
    all (uncurry eqLineByLabels) (zip l1 l2)
  (==) (CodeBlock i1 c1) (CodeBlock i2 c2) =
    eqConnByLabel i1 i2 &&
    c1 == c2

eqConnByLabel :: Connector a -> Connector b -> Bool
eqConnByLabel a b = connLabel a == connLabel b

eqLineByLabels :: AnyLine -> AnyLine -> Bool
eqLineByLabels a b = lFrom1 == lFrom2 && lTo1 == lTo2
  where (lFrom1, lTo1) = withAnyLine lineLabels a
        (lFrom2, lTo2) = withAnyLine lineLabels b

lineLabels :: Line a b -> (Label, Label)
lineLabels = withLineEnds connLabel

-- | IN connector of a block.
blockIn :: Block -> Connector In
blockIn (GraphBlock i _ _ _) = i
blockIn (CodeBlock  i _)     = i

-- | OUT connectors of a block.
blockOuts :: Block -> [Connector Out]
blockOuts (GraphBlock _ o _ _) = o
blockOuts (CodeBlock  i c)     = extractConnectorOuts (connOwner i) c -- alternatively, refer directly to the current CodeBlock instead of using 'connOwner'

-- | Subblocks of a block.
blockSubs :: Block -> [Block]
blockSubs (GraphBlock _ _ s _) = s
blockSubs (CodeBlock _ _) = []

-- | Lines of a block.
blockLines :: Block -> [AnyLine]
blockLines (GraphBlock _ _ _ l) = l
blockLines (CodeBlock _ _) = []

-- | Checks whether the given connector equals the given line's /to/.
isConnectedTo :: Typeable c => Connector c -> AnyLine -> Bool
isConnectedTo c l = Just c == (withAnyLine (cast . lineTo) l)

-- | Checks whether the given connector equals the given line's /from/.
isConnectedFrom :: Typeable c => Connector c -> AnyLine -> Bool
isConnectedFrom c l = Just c == (withAnyLine (cast . lineFrom) l)

isComplete :: Block -> Bool
isComplete b = isCompleteSelf && all isComplete (blockSubs b)
  where isCompleteSelf = 
          -- 1. there is ONE InputLine connected to block IN
          singleton isInputLine (filter (isConnectedFrom (blockIn b)) (blockLines b)) &&
          -- 2. only OutputLines connect block OUT
          all outConnectedByOutputLine (blockOuts b) && -- TODO: outdated, fix semantics
          -- 3. all subblock OUT are connected
          True -- TODO: implement
          -- 4. TODO: anything else?
        isInputLine l  = withAnyLine (is2 Input) l
        isOutputLine l = withAnyLine (is2 Output) l
        isInternalLine l = withAnyLine (is2 Internal) l
        singleton p l = case l of { [x] -> p x; _ -> False }
        outConnectedByOutputLine c = all isOutputLine . filter (isConnectedTo c) $ blockLines b
