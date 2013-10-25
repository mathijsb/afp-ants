{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (AntsToken)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (13) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (48) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (22) = happyShift action_6
action_5 _ = happyFail

action_6 (18) = happyShift action_7
action_6 _ = happyFail

action_7 (7) = happyGoto action_8
action_7 _ = happyReduce_5

action_8 (14) = happyShift action_11
action_8 (16) = happyShift action_12
action_8 (17) = happyShift action_13
action_8 (19) = happyShift action_14
action_8 (40) = happyShift action_15
action_8 (41) = happyShift action_16
action_8 (42) = happyShift action_17
action_8 (43) = happyShift action_18
action_8 (44) = happyShift action_19
action_8 (45) = happyShift action_20
action_8 (46) = happyShift action_21
action_8 (47) = happyShift action_22
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 _ = happyFail

action_9 _ = happyReduce_6

action_10 _ = happyReduce_11

action_11 (20) = happyShift action_35
action_11 _ = happyFail

action_12 (20) = happyShift action_34
action_12 _ = happyFail

action_13 _ = happyReduce_10

action_14 _ = happyReduce_4

action_15 (24) = happyShift action_30
action_15 (25) = happyShift action_31
action_15 (26) = happyShift action_32
action_15 (27) = happyShift action_33
action_15 (12) = happyGoto action_29
action_15 _ = happyFail

action_16 (23) = happyShift action_28
action_16 _ = happyFail

action_17 (23) = happyShift action_27
action_17 _ = happyFail

action_18 _ = happyReduce_17

action_19 _ = happyReduce_18

action_20 (28) = happyShift action_25
action_20 (29) = happyShift action_26
action_20 (11) = happyGoto action_24
action_20 _ = happyFail

action_21 _ = happyReduce_13

action_22 (23) = happyShift action_23
action_22 _ = happyFail

action_23 _ = happyReduce_19

action_24 _ = happyReduce_14

action_25 _ = happyReduce_30

action_26 _ = happyReduce_31

action_27 _ = happyReduce_16

action_28 _ = happyReduce_15

action_29 (30) = happyShift action_39
action_29 (31) = happyShift action_40
action_29 (32) = happyShift action_41
action_29 (33) = happyShift action_42
action_29 (34) = happyShift action_43
action_29 (35) = happyShift action_44
action_29 (36) = happyShift action_45
action_29 (37) = happyShift action_46
action_29 (38) = happyShift action_47
action_29 (39) = happyShift action_48
action_29 (10) = happyGoto action_38
action_29 _ = happyFail

action_30 _ = happyReduce_32

action_31 _ = happyReduce_33

action_32 _ = happyReduce_34

action_33 _ = happyReduce_35

action_34 (7) = happyGoto action_37
action_34 _ = happyReduce_5

action_35 (7) = happyGoto action_36
action_35 _ = happyReduce_5

action_36 (14) = happyShift action_11
action_36 (16) = happyShift action_12
action_36 (17) = happyShift action_13
action_36 (21) = happyShift action_50
action_36 (40) = happyShift action_15
action_36 (41) = happyShift action_16
action_36 (42) = happyShift action_17
action_36 (43) = happyShift action_18
action_36 (44) = happyShift action_19
action_36 (45) = happyShift action_20
action_36 (46) = happyShift action_21
action_36 (47) = happyShift action_22
action_36 (8) = happyGoto action_9
action_36 (9) = happyGoto action_10
action_36 _ = happyFail

action_37 (14) = happyShift action_11
action_37 (16) = happyShift action_12
action_37 (17) = happyShift action_13
action_37 (21) = happyShift action_49
action_37 (40) = happyShift action_15
action_37 (41) = happyShift action_16
action_37 (42) = happyShift action_17
action_37 (43) = happyShift action_18
action_37 (44) = happyShift action_19
action_37 (45) = happyShift action_20
action_37 (46) = happyShift action_21
action_37 (47) = happyShift action_22
action_37 (8) = happyGoto action_9
action_37 (9) = happyGoto action_10
action_37 _ = happyFail

action_38 _ = happyReduce_12

action_39 _ = happyReduce_20

action_40 _ = happyReduce_21

action_41 _ = happyReduce_22

action_42 _ = happyReduce_23

action_43 _ = happyReduce_24

action_44 _ = happyReduce_25

action_45 _ = happyReduce_26

action_46 _ = happyReduce_27

action_47 _ = happyReduce_28

action_48 _ = happyReduce_29

action_49 (18) = happyShift action_52
action_49 _ = happyFail

action_50 (18) = happyShift action_51
action_50 _ = happyFail

action_51 (7) = happyGoto action_54
action_51 _ = happyReduce_5

action_52 (7) = happyGoto action_53
action_52 _ = happyReduce_5

action_53 (14) = happyShift action_11
action_53 (16) = happyShift action_12
action_53 (17) = happyShift action_13
action_53 (19) = happyShift action_56
action_53 (40) = happyShift action_15
action_53 (41) = happyShift action_16
action_53 (42) = happyShift action_17
action_53 (43) = happyShift action_18
action_53 (44) = happyShift action_19
action_53 (45) = happyShift action_20
action_53 (46) = happyShift action_21
action_53 (47) = happyShift action_22
action_53 (8) = happyGoto action_9
action_53 (9) = happyGoto action_10
action_53 _ = happyFail

action_54 (14) = happyShift action_11
action_54 (16) = happyShift action_12
action_54 (17) = happyShift action_13
action_54 (19) = happyShift action_55
action_54 (40) = happyShift action_15
action_54 (41) = happyShift action_16
action_54 (42) = happyShift action_17
action_54 (43) = happyShift action_18
action_54 (44) = happyShift action_19
action_54 (45) = happyShift action_20
action_54 (46) = happyShift action_21
action_54 (47) = happyShift action_22
action_54 (8) = happyGoto action_9
action_54 (9) = happyGoto action_10
action_54 _ = happyFail

action_55 (15) = happyShift action_57
action_55 _ = happyReduce_7

action_56 _ = happyReduce_9

action_57 (18) = happyShift action_58
action_57 _ = happyFail

action_58 (7) = happyGoto action_59
action_58 _ = happyReduce_5

action_59 (14) = happyShift action_11
action_59 (16) = happyShift action_12
action_59 (17) = happyShift action_13
action_59 (19) = happyShift action_60
action_59 (40) = happyShift action_15
action_59 (41) = happyShift action_16
action_59 (42) = happyShift action_17
action_59 (43) = happyShift action_18
action_59 (44) = happyShift action_19
action_59 (45) = happyShift action_20
action_59 (46) = happyShift action_21
action_59 (47) = happyShift action_22
action_59 (8) = happyGoto action_9
action_59 (9) = happyGoto action_10
action_59 _ = happyFail

action_60 _ = happyReduce_8

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Program happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_0  5 happyReduction_2
happyReduction_2  =  HappyAbsSyn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 5 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Function happy_var_2 (reverse happy_var_4)
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_0  7 happyReduction_5
happyReduction_5  =  HappyAbsSyn7
		 ([]
	)

happyReduce_6 = happySpecReduce_2  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_2 : happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 8 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If (reverse happy_var_3) (reverse happy_var_6) []
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 11 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (If (reverse happy_var_3) (reverse happy_var_6) (reverse happy_var_10)
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 7 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (While (reverse happy_var_3) (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn8
		 (Break
	)

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_3)
	(HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  9 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn9
		 (Move
	)

happyReduce_14 = happySpecReduce_2  9 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Turn happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  9 happyReduction_15
happyReduction_15 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn9
		 (Mark happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  9 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn9
		 (Unmark happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn9
		 (PickUp
	)

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn9
		 (Drop
	)

happyReduce_19 = happySpecReduce_2  9 happyReduction_19
happyReduction_19 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn9
		 (Flip happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn10
		 (Friend
	)

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn10
		 (Foe
	)

happyReduce_22 = happySpecReduce_1  10 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn10
		 (FriendWithFood
	)

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 (FoeWithFood
	)

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn10
		 (Food
	)

happyReduce_25 = happySpecReduce_1  10 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn10
		 (Rock
	)

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn10
		 (Marker 0
	)

happyReduce_27 = happySpecReduce_1  10 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn10
		 (FoeMarker
	)

happyReduce_28 = happySpecReduce_1  10 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn10
		 (Home
	)

happyReduce_29 = happySpecReduce_1  10 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn10
		 (FoeHome
	)

happyReduce_30 = happySpecReduce_1  11 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn11
		 (IsLeft
	)

happyReduce_31 = happySpecReduce_1  11 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn11
		 (IsRight
	)

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn12
		 (Here
	)

happyReduce_33 = happySpecReduce_1  12 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn12
		 (Ahead
	)

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn12
		 (LeftAhead
	)

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn12
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 48 48 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 13;
	TokenIf -> cont 14;
	TokenElse -> cont 15;
	TokenWhile -> cont 16;
	TokenBreak -> cont 17;
	TokenBraceLeft -> cont 18;
	TokenBraceRight -> cont 19;
	TokenParensLeft -> cont 20;
	TokenParensRight -> cont 21;
	TokenIdentifier happy_dollar_dollar -> cont 22;
	TokenInteger happy_dollar_dollar -> cont 23;
	TokenHere -> cont 24;
	TokenAhead -> cont 25;
	TokenLeftAhead -> cont 26;
	TokenRightAhead -> cont 27;
	TokenLeft -> cont 28;
	TokenRight -> cont 29;
	TokenFriend -> cont 30;
	TokenFoe -> cont 31;
	TokenFriendWithFood -> cont 32;
	TokenFoeWithFood -> cont 33;
	TokenFood -> cont 34;
	TokenRock -> cont 35;
	TokenMarker -> cont 36;
	TokenFoeMarker -> cont 37;
	TokenHome -> cont 38;
	TokenFoeHome -> cont 39;
	TokenSense -> cont 40;
	TokenMark -> cont 41;
	TokenUnmark -> cont 42;
	TokenPickUp -> cont 43;
	TokenDrop -> cont 44;
	TokenTurn -> cont 45;
	TokenMove -> cont 46;
	TokenFlip -> cont 47;
	_ -> happyError' (tk:tks)
	}

happyError_ 48 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(AntsToken)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

parseAntsTokens tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 30 "templates/GenericTemplate.hs" #-}








{-# LINE 51 "templates/GenericTemplate.hs" #-}

{-# LINE 61 "templates/GenericTemplate.hs" #-}

{-# LINE 70 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	 (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 148 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
	 sts1@(((st1@(HappyState (action))):(_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where (sts1@(((st1@(HappyState (action))):(_)))) = happyDrop k ((st):(sts))
             drop_stk = happyDropStk k stk





             new_state = action


happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 246 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let (i) = (case x of { HappyErrorToken (i) -> i }) in
--	trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
	action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 312 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
