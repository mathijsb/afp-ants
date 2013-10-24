{-# LANGUAGE RankNTypes, GADTs, StandaloneDeriving, DeriveDataTypeable #-}

module Blocks where

import Data.Typeable
import Data.Maybe
import Data.List

type Label = String
data In deriving Typeable
data Out deriving Typeable

-- #########################################################################
--                              Type helpers
-- #########################################################################

-- TODO: can this be generalized over, for example using type classes?

is2 :: (Typeable c, Typeable x) => (a -> b -> c) -> x -> Bool
is2 f = is1 (f undefined)

is1 :: (Typeable c, Typeable x) => (b -> c) -> x -> Bool
is1 f = is0 (f undefined)

is0 :: (Typeable c, Typeable x) => c -> x -> Bool
is0 f x = case cast x of
            Just y  -> forceType f y True
            Nothing -> False

forceType :: a -> a -> b -> b
forceType _ _ = id


-- #########################################################################
--                           Connector definition
-- #########################################################################

data Connector a = Connector { connLabel :: Label, connOwner :: Block }
  deriving Eq

deriving instance Typeable1 Connector
instance Show (Connector a) where
                              -- Do not show owner, since the owner would most
                              -- likely show the connector, looping infinitely.
  showsPrec d c = showParen (d > 10) $ showString "Connector "
                                     . showsPrec 11 (connLabel c)

-- | Equality of 'Connector's, based only on the labels.
eqConnByLabel :: Connector a -> Connector b -> Bool
eqConnByLabel a b = connLabel a == connLabel b

-- #########################################################################
--                              Line definition
-- #########################################################################

{- $lines

@
       |
+------i------------+ 
|      | A          |
|      |            |
|      +--------.   |
|    +-i------+ |   |
|    |        | | C |
|    +-o---o--+ |   |
|      |   '----'   |
|      |            |
|      | B          |
+------o------------+
       |
@

* A: InputLine (from block-input to sub-input)

* B: OutputLine (from sub-output to block-output)

* C: InternalLine (from sub-output to sub-input)

-}

data Line a b where
  Input    :: Connector In  -> Connector In  -> InputLine
  Output   :: Connector Out -> Connector Out -> OutputLine
  Internal :: Connector Out -> Connector In  -> InternalLine

type InputLine    = Line In  In
type OutputLine   = Line Out Out
type InternalLine = Line Out In

deriving instance Typeable2 Line
deriving instance Show (Line a b)
deriving instance Eq (Line a b)

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

deriving instance Show AnyLine
instance Eq AnyLine where
  (==) (Line a@(Input _ _))    (Line b@(Input _ _))    = a == b
  (==) (Line a@(Output _ _))   (Line b@(Output _ _))   = a == b
  (==) (Line a@(Internal _ _)) (Line b@(Internal _ _)) = a == b
  (==) _                       _                       = False

-- | Convenience function for working with 'AnyLine's.
withAnyLine :: (forall a b. (Typeable a, Typeable b) => Line a b -> c) -> AnyLine -> c
withAnyLine f (Line l) = f l

-- | Convenience function for working with any 'Connector' at ends of a 'Line'.
withLineEnds :: (forall a. Connector a -> c) -> Line a b -> (c, c)
withLineEnds f l = (f $ lineFrom l, f $ lineTo l)

eqLineByLabels :: AnyLine -> AnyLine -> Bool
eqLineByLabels a b = lFrom1 == lFrom2 && lTo1 == lTo2
  where (lFrom1, lTo1) = withAnyLine lineLabels a
        (lFrom2, lTo2) = withAnyLine lineLabels b

lineLabels :: Line a b -> (Label, Label)
lineLabels = withLineEnds connLabel


-- #########################################################################
--                              Code definition
-- #########################################################################

-- TODO: Code datatype definition is to be moved to a separate module.

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

emptyCode = Code []

-- #########################################################################
--                              Block definition
-- #########################################################################

-- TODO: make GADT to be able to differentiate between CodeBlock and GraphBlock
-- on type level.

data Block = GraphBlock (Connector In) [Connector Out] [Block] [AnyLine]
           | CodeBlock  (Connector In) Code

deriving instance Show Block

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
  (==) _ _ = False

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


-- #########################################################################
--                             Helper predicates
-- #########################################################################

-- | Checks whether the given connector equals the given line's /to/.
isConnectedTo :: Typeable c => Connector c -> AnyLine -> Bool
isConnectedTo c l = Just c == (withAnyLine (cast . lineTo) l)

-- | Checks whether the given connector equals the given line's /from/.
isConnectedFrom :: Typeable c => Connector c -> AnyLine -> Bool
isConnectedFrom c l = Just c == (withAnyLine (cast . lineFrom) l)

-- | Checks whether a line is of the InputLine type.
isInputLine :: AnyLine -> Bool
isInputLine l  = withAnyLine (is2 Input) l

-- | Checks whether a line is of the OutputLine type.
isOutputLine :: AnyLine -> Bool
isOutputLine l = withAnyLine (is2 Output) l

-- | Checks whether a line is of the InternalLine type.
isInternalLine :: AnyLine -> Bool
isInternalLine l = withAnyLine (is2 Internal) l

-- | Predicate over head of singleton list, False on any non-singleton list.
singleton :: (a -> Bool) -> [a] -> Bool
singleton p l = case l of 
                  [x] -> p x
                  _   -> False

-- TODO: idea: what if we do not let the next functions return a Bool, but a
-- Maybe Error: Nothing would indicate success, Just Error would give a useful
-- error message.
-- The block manipulation 'validate' could then be altered to be of type
-- @Block -> Either Error Block@.

-- | Checks whether a 'Block' is complete, i.e. sufficient connections are made.
isComplete :: Block -> Bool
isComplete b = isCompleteSelf && all isComplete (blockSubs b)
  where isCompleteSelf = 
          -- Base: this block is valid.
          isValid b &&
          -- 1. there is ONE InputLine connected from block IN
          singleton isInputLine (filter (isConnectedFrom (blockIn b)) (blockLines b)) &&
          -- 2. only OutputLines connect to block OUT
          all outConnectedByOutputLine (blockOuts b) && -- TODO: wrong code, fix semantics: all isOutputLine $ filter (\l -> any (flip isConnectedTo l) (blockOuts b)) (blockLines b) ???
          -- 3. all subblock OUT are connected from
          True && -- TODO: implement
          -- 4. TODO: anything else?
          True
        outConnectedByOutputLine c = all isOutputLine . filter (isConnectedTo c) $ blockLines b

-- | Checks whether a 'Block' is valid, i.e. regardless of its completeness, it
-- does not contain any illegal values.
isValid :: Block -> Bool
isValid b = True -- TODO: implement checks, such as:
                           -- duplicate labels
                           -- illegal lines
                           -- wrong parents of line connectors

-- #########################################################################
--                             Block manipulation
-- #########################################################################

{-

The general for of the functions defined here is:

@
action :: Monad m => Block -> TheArgument -> m Block
@

The Monad can be chosen 'Maybe' to track failure: after each action, the 
resulting block is validated.

-}



emptyGraphBlock :: Label -> Block
emptyGraphBlock l =
  let b = GraphBlock (Connector { connLabel = l, connOwner = b }) [] [] [] in b

emptyCodeBlock :: Label -> Block
emptyCodeBlock l = 
  let b = CodeBlock (Connector { connLabel = l, connOwner = b }) emptyCode in b

-- | Validates a block, and passes it through if it is valid. Otherwise, fails.
validate :: Monad m => Block -> m Block
validate b = if isValid b
               then return b
               else fail "block is invalid"

assert :: Monad m => String -> Bool -> m ()
assert m p = if p then return () else fail m

-- | Into the parent 'GraphBlock', insert the child. Fails if the resulting
-- block is invalid.
addChild :: Monad m => Block -> Block -> m Block
addChild p@(GraphBlock i os bs ls) c = validate $ GraphBlock i os (c : bs) ls
addChild _ _ = fail "can only add children to GraphBlocks"

-- | From the parent 'GraphBlock', remove the child and all its connections
-- within the parent. Fails if the resulting block is invalid or the child block
-- is not in scope.
removeChild :: Monad m => Block -> Block -> m Block
removeChild p@(GraphBlock i os cs ls) c = do
  assert "child block not in scope" $ c `elem` cs
  let cs' = delete c cs
  let ls' = filter (\l -> isConnectedTo (blockIn c) l || any (flip isConnectedFrom l) (blockOuts c)) ls
  validate $ GraphBlock i os cs' ls'
removeChild _ _ = fail "can only remove children from GraphBlocks"

-- TODO: alternatively, we might want to return the AnyLink as well
-- | Adds an 'InternalLine' between two children of the given block, failing
-- if the resulting block is invalid or the children are not in scope.
addInternalLine :: Monad m => Block -> Connector Out -> Connector In -> m Block
addInternalLine p@(GraphBlock i os bs ls) c1 c2 = do
  let (b1, b2) = (connOwner c1, connOwner c2)
  assert "first connector not in scope" $ b1 `elem` bs  -- TODO: move to isValid?
  assert "second connector not in scope" $ b2 `elem` bs -- TODO: move to isValid
  let ls' = Line (Internal c1 c2) : ls
  validate $ GraphBlock i os bs ls'
addInternalLine _ _ _ = fail "can only add lines to GraphBlocks"

-- | Adds an 'InputLine' to a child of the given block, failing
-- if the resulting block is invalid or the child is not in scope.
addInputLine :: Monad m => Block -> Connector In -> m Block
addInputLine p@(GraphBlock i os bs ls) c = do
  assert "can only connect one InputLine" $ not (any isInputLine ls)
  let b = connOwner c
  assert "connector not in scope" $ b `elem` bs  -- TODO: move to isValid?
  let ls' = Line (Input (blockIn b) c) : ls
  validate $ GraphBlock i os bs ls'
addInputLine _ _ = fail "can only add lines to GraphBlocks"

addOutputLine :: Monad m => Block -> Connector Out -> m Block
addOutputLine p c = fail "not implemented" -- TODO: implement

removeLine :: Monad m => Block -> AnyLine -> m Block
removeLine p@(GraphBlock i os bs ls) l = do
  assert "removing non-existing line" $ l `elem` ls
  let ls' = delete l ls
  validate $ GraphBlock i os bs ls'
