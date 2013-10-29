{-# LANGUAGE RankNTypes, GADTs, StandaloneDeriving, DeriveDataTypeable #-}

module Blocks where

import Data.Typeable
import Data.Maybe
import Data.List

type Label = String
type Path = [Label]
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

castM :: (Typeable a, Typeable b, Monad m) => a -> m b
castM v = case cast v of
            Just v' -> return v'
            Nothing -> fail "illegal type"

-- #########################################################################
--                           Connector definition
-- #########################################################################

data Connector a where
  In  :: Path -> Connector In
  Out :: Label -> Path -> Connector Out

deriving instance Typeable1 Connector
deriving instance Eq (Connector a)
deriving instance Show (Connector a)

connLabel :: Connector Out -> Label
connLabel (Out l _) = l

-- | Returns the path to the block associated with the connector.
connPath :: Connector a -> Path
connPath (In p)    = p
connPath (Out _ p) = p

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
lineFrom l = case l of
  Input    f _ -> f
  Output   f _ -> f
  Internal f _ -> f

lineTo :: Line a b -> Connector b
lineTo l = case l of
  Input    _ t -> t
  Output   _ t -> t
  Internal _ t -> t

replaceFrom :: Connector a -> Line a b -> Line a b
replaceFrom f l = case l of
  Input    _ t -> Input    f t
  Output   _ t -> Output   f t
  Internal _ t -> Internal f t

replaceTo :: Connector b -> Line a b -> Line a b
replaceTo t l = case l of
  Input    f _ -> Input    f t
  Output   f _ -> Output   f t
  Internal f _ -> Internal f t

replaceAnyFrom :: (Typeable a, Monad m) => Connector a -> AnyLine -> m AnyLine
replaceAnyFrom f (Line l) = castM f >>= return . Line . flip replaceFrom l

replaceAnyTo :: (Typeable a, Monad m) => Connector a -> AnyLine -> m AnyLine
replaceAnyTo f (Line l) = castM f >>= return . Line . flip replaceTo l

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

{-
eqLineByLabels :: AnyLine -> AnyLine -> Bool
eqLineByLabels a b = lFrom1 == lFrom2 && lTo1 == lTo2
  where (lFrom1, lTo1) = withAnyLine lineLabels a
        (lFrom2, lTo2) = withAnyLine lineLabels b

lineLabels :: Line a b -> (Label, Label)
lineLabels = withLineEnds connLabel
-}

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

extractConnectorOuts :: Block -> [Connector Out]
extractConnectorOuts b@(CodeBlock _ (Code x)) = map (\l -> Out l (blockPath b)) x
-- TODO: GraphBlock error, empty list, ...?

emptyCode = Code []

-- #########################################################################
--                              Block definition
-- #########################################################################

-- TODO: make GADT to be able to differentiate between CodeBlock and GraphBlock
-- on type level.

data Block = GraphBlock (Connector In) [Connector Out] [Block] [AnyLine]
           | CodeBlock  (Connector In) Code

deriving instance Show Block

-- FIXME: just use deriving, we keep explicit paths now.
{-
instance Eq Block where
  -- TODO: sorting order of data? For now, this works to establish physical equality.
  (==) (GraphBlock i1 o1 b1 l1) (GraphBlock i2 o2 b2 l2) =
    eqConnByLabel i1 i2 &&
    all (uncurry eqConnByLabel) (zip o1 o2) &&
    all (uncurry eqLineByLabels) (zip l1 l2) &&
    all (uncurry (==)) (zip b1 b2)
  (==) (CodeBlock i1 c1) (CodeBlock i2 c2) =
    eqConnByLabel i1 i2 &&
    c1 == c2
  (==) _ _ = False
-}
deriving instance Eq Block

-- | IN connector of a block.
blockIn :: Block -> Connector In
blockIn (GraphBlock i _ _ _) = i
blockIn (CodeBlock  i _)     = i

-- | OUT connectors of a block.
blockOuts :: Block -> [Connector Out]
blockOuts (GraphBlock _ o _ _) = o
blockOuts b@(CodeBlock _ _)    = extractConnectorOuts b

-- | Subblocks of a block.
blockSubs :: Block -> [Block]
blockSubs (GraphBlock _ _ s _) = s
blockSubs (CodeBlock _ _) = []

-- | Lines of a block.
blockLines :: Block -> [AnyLine]
blockLines (GraphBlock _ _ _ l) = l
blockLines (CodeBlock _ _) = []

blockPath :: Block -> Path
blockPath b = let i = blockIn b in connPath i

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
-- does not contain any illegal values. Note that 'isValid' does not check the
-- validity of the children of the block.
isValid :: Block -> Bool
isValid b = True -- TODO: implement checks, such as:
                           -- duplicate connector labels
                           -- illegal lines
                           -- wrong parents of line connectors

-- #########################################################################
--                             Block manipulation
-- #########################################################################

{-

The general for of the functions defined here is:

@
action :: Monad m => Block -> TheArguments -> m Block
@

The first block is generally the parent block P, and is returned in the end.
Actions never have effects that extend beyond the scope of P, i.e. parents of P
are never invalidated by the changes. The strategy is to /ask the parent/ to
/modify the children/. Since the lines are limited to the scope of the parent,
this strategy works.

The Monad can be chosen 'Maybe' to track failure: after each action, the 
resulting block is validated.

-}

connOwner :: Connector a -> Block
connOwner = undefined

isChildConn :: Block -> Connector a -> Bool
isChildConn p c = blockPath p == tail (connPath c) -- TODO: exists check

isChildBlock :: Block -> Block -> Bool
isChildBlock p c = blockPath p == tail (blockPath c) -- TODO: exists check

-- TODO: move to relevant section
emptyIn :: Label -> Connector In
emptyIn l = In [l]

emptyGraphBlock :: Label -> Block
emptyGraphBlock l =
  let b = GraphBlock (emptyIn l) [] [] [] in b

emptyCodeBlock :: Label -> Block
emptyCodeBlock l = 
  let b = CodeBlock (emptyIn l) emptyCode in b

-- | Validates a block, and passes it through if it is valid. Otherwise, fails.
validate :: Monad m => Block -> m Block
validate b = if isValid b
               then return b
               else fail "block is invalid"

assert :: Monad m => String -> Bool -> m ()
assert m p = if p then return () else fail m

-- TODO: fix path
-- | Into the parent 'GraphBlock', insert the child. Fails if the resulting
-- block is invalid.
addChild :: Monad m => Block -> Block -> m Block
addChild p@(GraphBlock i os bs ls) c = validate $ GraphBlock i os (c : bs) ls
addChild _ _ = fail "can only add children to GraphBlocks"


-- TODO: fix path
-- | From the parent 'GraphBlock', remove the child and all its connections
-- within the parent. Fails if the resulting block is invalid or the child block
-- is not in scope.
removeChild :: Monad m => Block -> Block -> m Block
removeChild p@(GraphBlock i os cs ls) c = do
  assert "child block not in scope" $ c `elem` cs
  let cs' = delete c cs
  let ls' = filter (\l -> isConnectedTo (blockIn c) l || any (flip isConnectedFrom l) (blockOuts c)) ls -- FIXME: oops! negate?
  validate $ GraphBlock i os cs' ls'
removeChild _ _ = fail "can only remove children from GraphBlocks"

-- TODO: alternatively, we might want to return the AnyLink as well?
-- | Adds an 'InternalLine' between two children of the given block, failing
-- if the resulting block is invalid or the children are not in scope.
addInternalLine :: Monad m => Block -> Connector Out -> Block -> m Block
addInternalLine p@(GraphBlock i os bs ls) c b = do
  assert "first connector not in scope" $ isChildConn p c  -- TODO: move to isValid?
  assert "second connector not in scope" $ isChildBlock p b -- TODO: move to isValid?
  let ls' = Line (Internal c (blockIn b)) : ls
  validate $ GraphBlock i os bs ls'
addInternalLine _ _ _ = fail "can only add lines to GraphBlocks"

-- | Adds an 'InputLine' to a child of the given block, failing
-- if the resulting block is invalid or the child is not in scope.
addInputLine :: Monad m => Block -> Block -> m Block
addInputLine p@(GraphBlock i os bs ls) c = do
  assert "can only connect one InputLine" $ not (any isInputLine ls)
  assert "connector not in scope" $ isChildBlock p c  -- TODO: move to isValid?
  let ls' = Line (Input (blockIn p) (blockIn c)) : ls
  validate $ GraphBlock i os bs ls'
addInputLine _ _ = fail "can only add lines to GraphBlocks"

addOutputLine :: Monad m => Block -> Connector Out -> m Block
addOutputLine p c = fail "not implemented yet" -- FIXME: implement

removeLine :: Monad m => Block -> AnyLine -> m Block
removeLine p@(GraphBlock i os bs ls) l = do
  assert "removing non-existing line" $ l `elem` ls
  let ls' = delete l ls
  validate $ GraphBlock i os bs ls'

addConnector :: Monad m => Block -> Block -> Label -> m Block
addConnector p@(GraphBlock i os bs ls) b l = do
  assert "child block not in scope" $ isChildBlock p b
  b' <- case b of
          GraphBlock i' os' bs' ls' -> do
            let os'' = (Out l (blockPath b)) : os
            validate $ GraphBlock i' os'' bs' ls'
          CodeBlock _ _ -> fail "can only directly add connectors in GraphBlocks"
  let bs' = b' : delete b bs
  validate $ GraphBlock i os bs' ls
addConnector _ _ _ = fail "can only alter children of GraphBlocks"

removeConnector :: Monad m => Block -> Connector Out -> m Block
removeConnector p@(GraphBlock i os bs ls) c = do
  let b = connOwner c
  assert "connector not in scope" $ b `elem` bs
  b' <- case b of
          GraphBlock i' os' bs' ls' -> do
            assert "non-existing connector" $ c `elem` os'
            let os'' = delete c os'
            let ls'' = filter (not . isConnectedFrom c) ls
            validate $ GraphBlock i' os'' bs' ls''
          CodeBlock _ _ -> fail "can only directly remove connectors in GraphBlocks"
  let bs' = b' : delete b bs
  let ls' = filter (not . isConnectedFrom c) ls
  validate $ GraphBlock i os bs' ls'
removeConnector _ _ = fail "can only alter children of GraphBlocks"

-- TODO: move
getParentInPath :: Monad m => Path -> m Path
getParentInPath (b : bs) = return bs
getParentInPath _        = fail "cannot get parent of empty path"

-- TODO: move
getChildByLabel :: Monad m => Block -> Label -> m Block
getChildByLabel = fail "not implemented yet"

-- TODO: move
getDescendantByPath :: Monad m => Block -> Path -> m Block
getDescendantByPath = fail "not implemented yet"

-- TODO: move
replaceAllTo :: (Typeable a, Monad m) => Connector a -> Connector a -> [AnyLine] -> m [AnyLine]
replaceAllTo old new ls = mapM (\l -> if isConnectedTo old l
                                        then replaceAnyTo new l
                                        else return l) ls

-- TODO: move
replaceAllFrom :: (Typeable a, Monad m) => Connector a -> Connector a -> [AnyLine] -> m [AnyLine]
replaceAllFrom old new ls = mapM (\l -> if isConnectedFrom old l
                                        then replaceAnyFrom new l
                                        else return l) ls

relabelConnector :: Monad m => Block -> Connector Out -> Label -> m Block
relabelConnector p@(GraphBlock i os bs ls) c new = do
  assert "connector not in scope" $ isChildConn p c
  let c' = Out new (connPath c)
  b <- getChildByLabel p $ connLabel c
  b' <- case b of
          GraphBlock i' os' bs' ls' -> do
            let os'' = c' : delete c os'
            ls'' <- replaceAllTo c c' ls'
            validate $ GraphBlock i' os'' bs' ls''
  let bs' = b' : delete b bs
  ls' <- replaceAllFrom c c' ls
  validate $ GraphBlock i os bs' ls'
relabelConnector _ _ _ = fail "can only alter children of GraphBlocks"

-- TODO: traverse tree

