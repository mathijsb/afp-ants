{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
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
	| HappyAbsSyn13 t13

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (14) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (51) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (25) = happyShift action_6
action_5 _ = happyFail

action_6 (21) = happyShift action_7
action_6 _ = happyFail

action_7 (7) = happyGoto action_8
action_7 _ = happyReduce_5

action_8 (15) = happyShift action_12
action_8 (17) = happyShift action_13
action_8 (18) = happyShift action_14
action_8 (19) = happyShift action_15
action_8 (20) = happyShift action_16
action_8 (22) = happyShift action_17
action_8 (43) = happyShift action_18
action_8 (44) = happyShift action_19
action_8 (45) = happyShift action_20
action_8 (46) = happyShift action_21
action_8 (47) = happyShift action_22
action_8 (48) = happyShift action_23
action_8 (49) = happyShift action_24
action_8 (50) = happyShift action_25
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 (10) = happyGoto action_11
action_8 _ = happyFail

action_9 _ = happyReduce_6

action_10 (16) = happyShift action_40
action_10 _ = happyReduce_7

action_11 _ = happyReduce_12

action_12 (23) = happyShift action_39
action_12 _ = happyFail

action_13 (23) = happyShift action_38
action_13 _ = happyFail

action_14 _ = happyReduce_11

action_15 _ = happyReduce_23

action_16 (19) = happyShift action_15
action_16 (20) = happyShift action_16
action_16 (43) = happyShift action_18
action_16 (44) = happyShift action_19
action_16 (45) = happyShift action_20
action_16 (46) = happyShift action_21
action_16 (47) = happyShift action_22
action_16 (48) = happyShift action_23
action_16 (49) = happyShift action_24
action_16 (50) = happyShift action_25
action_16 (10) = happyGoto action_37
action_16 _ = happyFail

action_17 _ = happyReduce_4

action_18 (27) = happyShift action_33
action_18 (28) = happyShift action_34
action_18 (29) = happyShift action_35
action_18 (30) = happyShift action_36
action_18 (13) = happyGoto action_32
action_18 _ = happyFail

action_19 (26) = happyShift action_31
action_19 _ = happyFail

action_20 (26) = happyShift action_30
action_20 _ = happyFail

action_21 _ = happyReduce_19

action_22 _ = happyReduce_20

action_23 (31) = happyShift action_28
action_23 (32) = happyShift action_29
action_23 (12) = happyGoto action_27
action_23 _ = happyFail

action_24 _ = happyReduce_15

action_25 (26) = happyShift action_26
action_25 _ = happyFail

action_26 _ = happyReduce_21

action_27 _ = happyReduce_16

action_28 _ = happyReduce_34

action_29 _ = happyReduce_35

action_30 _ = happyReduce_18

action_31 _ = happyReduce_17

action_32 (33) = happyShift action_46
action_32 (34) = happyShift action_47
action_32 (35) = happyShift action_48
action_32 (36) = happyShift action_49
action_32 (37) = happyShift action_50
action_32 (38) = happyShift action_51
action_32 (39) = happyShift action_52
action_32 (40) = happyShift action_53
action_32 (41) = happyShift action_54
action_32 (42) = happyShift action_55
action_32 (11) = happyGoto action_45
action_32 _ = happyFail

action_33 _ = happyReduce_36

action_34 _ = happyReduce_37

action_35 _ = happyReduce_38

action_36 _ = happyReduce_39

action_37 _ = happyReduce_22

action_38 (19) = happyShift action_15
action_38 (20) = happyShift action_16
action_38 (43) = happyShift action_18
action_38 (44) = happyShift action_19
action_38 (45) = happyShift action_20
action_38 (46) = happyShift action_21
action_38 (47) = happyShift action_22
action_38 (48) = happyShift action_23
action_38 (49) = happyShift action_24
action_38 (50) = happyShift action_25
action_38 (10) = happyGoto action_44
action_38 _ = happyFail

action_39 (19) = happyShift action_15
action_39 (20) = happyShift action_16
action_39 (43) = happyShift action_18
action_39 (44) = happyShift action_19
action_39 (45) = happyShift action_20
action_39 (46) = happyShift action_21
action_39 (47) = happyShift action_22
action_39 (48) = happyShift action_23
action_39 (49) = happyShift action_24
action_39 (50) = happyShift action_25
action_39 (10) = happyGoto action_43
action_39 _ = happyFail

action_40 (15) = happyShift action_12
action_40 (21) = happyShift action_42
action_40 (9) = happyGoto action_41
action_40 _ = happyFail

action_41 _ = happyReduce_8

action_42 (7) = happyGoto action_58
action_42 _ = happyReduce_5

action_43 (24) = happyShift action_57
action_43 _ = happyFail

action_44 (24) = happyShift action_56
action_44 _ = happyFail

action_45 _ = happyReduce_14

action_46 _ = happyReduce_24

action_47 _ = happyReduce_25

action_48 _ = happyReduce_26

action_49 _ = happyReduce_27

action_50 _ = happyReduce_28

action_51 _ = happyReduce_29

action_52 _ = happyReduce_30

action_53 _ = happyReduce_31

action_54 _ = happyReduce_32

action_55 _ = happyReduce_33

action_56 (21) = happyShift action_61
action_56 _ = happyFail

action_57 (21) = happyShift action_60
action_57 _ = happyFail

action_58 (15) = happyShift action_12
action_58 (17) = happyShift action_13
action_58 (18) = happyShift action_14
action_58 (19) = happyShift action_15
action_58 (20) = happyShift action_16
action_58 (22) = happyShift action_59
action_58 (43) = happyShift action_18
action_58 (44) = happyShift action_19
action_58 (45) = happyShift action_20
action_58 (46) = happyShift action_21
action_58 (47) = happyShift action_22
action_58 (48) = happyShift action_23
action_58 (49) = happyShift action_24
action_58 (50) = happyShift action_25
action_58 (8) = happyGoto action_9
action_58 (9) = happyGoto action_10
action_58 (10) = happyGoto action_11
action_58 _ = happyFail

action_59 _ = happyReduce_9

action_60 (7) = happyGoto action_63
action_60 _ = happyReduce_5

action_61 (7) = happyGoto action_62
action_61 _ = happyReduce_5

action_62 (15) = happyShift action_12
action_62 (17) = happyShift action_13
action_62 (18) = happyShift action_14
action_62 (19) = happyShift action_15
action_62 (20) = happyShift action_16
action_62 (22) = happyShift action_65
action_62 (43) = happyShift action_18
action_62 (44) = happyShift action_19
action_62 (45) = happyShift action_20
action_62 (46) = happyShift action_21
action_62 (47) = happyShift action_22
action_62 (48) = happyShift action_23
action_62 (49) = happyShift action_24
action_62 (50) = happyShift action_25
action_62 (8) = happyGoto action_9
action_62 (9) = happyGoto action_10
action_62 (10) = happyGoto action_11
action_62 _ = happyFail

action_63 (15) = happyShift action_12
action_63 (17) = happyShift action_13
action_63 (18) = happyShift action_14
action_63 (19) = happyShift action_15
action_63 (20) = happyShift action_16
action_63 (22) = happyShift action_64
action_63 (43) = happyShift action_18
action_63 (44) = happyShift action_19
action_63 (45) = happyShift action_20
action_63 (46) = happyShift action_21
action_63 (47) = happyShift action_22
action_63 (48) = happyShift action_23
action_63 (49) = happyShift action_24
action_63 (50) = happyShift action_25
action_63 (8) = happyGoto action_9
action_63 (9) = happyGoto action_10
action_63 (10) = happyGoto action_11
action_63 _ = happyFail

action_64 _ = happyReduce_13

action_65 _ = happyReduce_10

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

happyReduce_7 = happySpecReduce_1  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 []
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  8 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1 ([happy_var_3 []])
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happyReduce 5 8 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (happy_var_1 (reverse happy_var_4)
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 8 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (While happy_var_3 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_11 = happySpecReduce_1  8 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn8
		 (Break
	)

happyReduce_12 = happySpecReduce_1  8 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn8
		 (Expr happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happyReduce 7 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (If happy_var_3 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_3)
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  10 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn10
		 (Move
	)

happyReduce_16 = happySpecReduce_2  10 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Turn happy_var_2
	)
happyReduction_16 _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  10 happyReduction_17
happyReduction_17 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn10
		 (Mark happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  10 happyReduction_18
happyReduction_18 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn10
		 (Unmark happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn10
		 (PickUp
	)

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn10
		 (Drop
	)

happyReduce_21 = happySpecReduce_2  10 happyReduction_21
happyReduction_21 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn10
		 (Flip happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  10 happyReduction_22
happyReduction_22 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Not happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  10 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn10
		 (BoolExpression True
	)

happyReduce_24 = happySpecReduce_1  11 happyReduction_24
happyReduction_24 _
	 =  HappyAbsSyn11
		 (Friend
	)

happyReduce_25 = happySpecReduce_1  11 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn11
		 (Foe
	)

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn11
		 (FriendWithFood
	)

happyReduce_27 = happySpecReduce_1  11 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn11
		 (FoeWithFood
	)

happyReduce_28 = happySpecReduce_1  11 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn11
		 (Food
	)

happyReduce_29 = happySpecReduce_1  11 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn11
		 (Rock
	)

happyReduce_30 = happySpecReduce_1  11 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn11
		 (Marker 0
	)

happyReduce_31 = happySpecReduce_1  11 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn11
		 (FoeMarker
	)

happyReduce_32 = happySpecReduce_1  11 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn11
		 (Home
	)

happyReduce_33 = happySpecReduce_1  11 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn11
		 (FoeHome
	)

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn12
		 (IsLeft
	)

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn12
		 (IsRight
	)

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn13
		 (Here
	)

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn13
		 (Ahead
	)

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn13
		 (LeftAhead
	)

happyReduce_39 = happySpecReduce_1  13 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn13
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 14;
	TokenIf -> cont 15;
	TokenElse -> cont 16;
	TokenWhile -> cont 17;
	TokenBreak -> cont 18;
	TokenTrue -> cont 19;
	TokenNot -> cont 20;
	TokenBraceLeft -> cont 21;
	TokenBraceRight -> cont 22;
	TokenParensLeft -> cont 23;
	TokenParensRight -> cont 24;
	TokenIdentifier happy_dollar_dollar -> cont 25;
	TokenInteger happy_dollar_dollar -> cont 26;
	TokenHere -> cont 27;
	TokenAhead -> cont 28;
	TokenLeftAhead -> cont 29;
	TokenRightAhead -> cont 30;
	TokenLeft -> cont 31;
	TokenRight -> cont 32;
	TokenFriend -> cont 33;
	TokenFoe -> cont 34;
	TokenFriendWithFood -> cont 35;
	TokenFoeWithFood -> cont 36;
	TokenFood -> cont 37;
	TokenRock -> cont 38;
	TokenMarker -> cont 39;
	TokenFoeMarker -> cont 40;
	TokenHome -> cont 41;
	TokenFoeHome -> cont 42;
	TokenSense -> cont 43;
	TokenMark -> cont 44;
	TokenUnmark -> cont 45;
	TokenPickUp -> cont 46;
	TokenDrop -> cont 47;
	TokenTurn -> cont 48;
	TokenMove -> cont 49;
	TokenFlip -> cont 50;
	_ -> happyError' (tk:tks)
	}

happyError_ 51 tk tks = happyError' tks
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


toList x = [x]

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
