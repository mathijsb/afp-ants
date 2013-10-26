{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
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
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (16) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (55) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (27) = happyShift action_6
action_5 _ = happyFail

action_6 (23) = happyShift action_7
action_6 _ = happyFail

action_7 (7) = happyGoto action_8
action_7 _ = happyReduce_5

action_8 (17) = happyShift action_14
action_8 (19) = happyShift action_15
action_8 (20) = happyShift action_16
action_8 (21) = happyShift action_17
action_8 (22) = happyShift action_18
action_8 (24) = happyShift action_19
action_8 (25) = happyShift action_20
action_8 (27) = happyShift action_21
action_8 (47) = happyShift action_22
action_8 (48) = happyShift action_23
action_8 (49) = happyShift action_24
action_8 (50) = happyShift action_25
action_8 (51) = happyShift action_26
action_8 (52) = happyShift action_27
action_8 (53) = happyShift action_28
action_8 (54) = happyShift action_29
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 (10) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyFail

action_9 _ = happyReduce_6

action_10 (18) = happyShift action_48
action_10 _ = happyReduce_7

action_11 _ = happyReduce_12

action_12 (29) = happyShift action_46
action_12 (30) = happyShift action_47
action_12 _ = happyReduce_16

action_13 _ = happyReduce_17

action_14 (25) = happyShift action_45
action_14 _ = happyFail

action_15 (25) = happyShift action_44
action_15 _ = happyFail

action_16 _ = happyReduce_11

action_17 _ = happyReduce_19

action_18 (21) = happyShift action_17
action_18 (22) = happyShift action_18
action_18 (25) = happyShift action_20
action_18 (27) = happyShift action_21
action_18 (47) = happyShift action_22
action_18 (48) = happyShift action_23
action_18 (49) = happyShift action_24
action_18 (50) = happyShift action_25
action_18 (51) = happyShift action_26
action_18 (52) = happyShift action_27
action_18 (53) = happyShift action_28
action_18 (54) = happyShift action_29
action_18 (11) = happyGoto action_43
action_18 (12) = happyGoto action_13
action_18 _ = happyFail

action_19 _ = happyReduce_4

action_20 (21) = happyShift action_17
action_20 (22) = happyShift action_18
action_20 (25) = happyShift action_20
action_20 (27) = happyShift action_21
action_20 (47) = happyShift action_22
action_20 (48) = happyShift action_23
action_20 (49) = happyShift action_24
action_20 (50) = happyShift action_25
action_20 (51) = happyShift action_26
action_20 (52) = happyShift action_27
action_20 (53) = happyShift action_28
action_20 (54) = happyShift action_29
action_20 (10) = happyGoto action_42
action_20 (11) = happyGoto action_12
action_20 (12) = happyGoto action_13
action_20 _ = happyFail

action_21 (25) = happyShift action_41
action_21 _ = happyFail

action_22 (31) = happyShift action_37
action_22 (32) = happyShift action_38
action_22 (33) = happyShift action_39
action_22 (34) = happyShift action_40
action_22 (15) = happyGoto action_36
action_22 _ = happyFail

action_23 (28) = happyShift action_35
action_23 _ = happyFail

action_24 (28) = happyShift action_34
action_24 _ = happyFail

action_25 _ = happyReduce_27

action_26 _ = happyReduce_28

action_27 (35) = happyShift action_32
action_27 (36) = happyShift action_33
action_27 (14) = happyGoto action_31
action_27 _ = happyFail

action_28 _ = happyReduce_23

action_29 (28) = happyShift action_30
action_29 _ = happyFail

action_30 _ = happyReduce_29

action_31 _ = happyReduce_24

action_32 _ = happyReduce_40

action_33 _ = happyReduce_41

action_34 _ = happyReduce_26

action_35 _ = happyReduce_25

action_36 (37) = happyShift action_58
action_36 (38) = happyShift action_59
action_36 (39) = happyShift action_60
action_36 (40) = happyShift action_61
action_36 (41) = happyShift action_62
action_36 (42) = happyShift action_63
action_36 (43) = happyShift action_64
action_36 (44) = happyShift action_65
action_36 (45) = happyShift action_66
action_36 (46) = happyShift action_67
action_36 (13) = happyGoto action_57
action_36 _ = happyFail

action_37 _ = happyReduce_42

action_38 _ = happyReduce_43

action_39 _ = happyReduce_44

action_40 _ = happyReduce_45

action_41 (26) = happyShift action_56
action_41 _ = happyFail

action_42 (26) = happyShift action_55
action_42 _ = happyFail

action_43 _ = happyReduce_18

action_44 (21) = happyShift action_17
action_44 (22) = happyShift action_18
action_44 (25) = happyShift action_20
action_44 (27) = happyShift action_21
action_44 (47) = happyShift action_22
action_44 (48) = happyShift action_23
action_44 (49) = happyShift action_24
action_44 (50) = happyShift action_25
action_44 (51) = happyShift action_26
action_44 (52) = happyShift action_27
action_44 (53) = happyShift action_28
action_44 (54) = happyShift action_29
action_44 (10) = happyGoto action_54
action_44 (11) = happyGoto action_12
action_44 (12) = happyGoto action_13
action_44 _ = happyFail

action_45 (21) = happyShift action_17
action_45 (22) = happyShift action_18
action_45 (25) = happyShift action_20
action_45 (27) = happyShift action_21
action_45 (47) = happyShift action_22
action_45 (48) = happyShift action_23
action_45 (49) = happyShift action_24
action_45 (50) = happyShift action_25
action_45 (51) = happyShift action_26
action_45 (52) = happyShift action_27
action_45 (53) = happyShift action_28
action_45 (54) = happyShift action_29
action_45 (10) = happyGoto action_53
action_45 (11) = happyGoto action_12
action_45 (12) = happyGoto action_13
action_45 _ = happyFail

action_46 (21) = happyShift action_17
action_46 (22) = happyShift action_18
action_46 (25) = happyShift action_20
action_46 (27) = happyShift action_21
action_46 (47) = happyShift action_22
action_46 (48) = happyShift action_23
action_46 (49) = happyShift action_24
action_46 (50) = happyShift action_25
action_46 (51) = happyShift action_26
action_46 (52) = happyShift action_27
action_46 (53) = happyShift action_28
action_46 (54) = happyShift action_29
action_46 (10) = happyGoto action_52
action_46 (11) = happyGoto action_12
action_46 (12) = happyGoto action_13
action_46 _ = happyFail

action_47 (21) = happyShift action_17
action_47 (22) = happyShift action_18
action_47 (25) = happyShift action_20
action_47 (27) = happyShift action_21
action_47 (47) = happyShift action_22
action_47 (48) = happyShift action_23
action_47 (49) = happyShift action_24
action_47 (50) = happyShift action_25
action_47 (51) = happyShift action_26
action_47 (52) = happyShift action_27
action_47 (53) = happyShift action_28
action_47 (54) = happyShift action_29
action_47 (10) = happyGoto action_51
action_47 (11) = happyGoto action_12
action_47 (12) = happyGoto action_13
action_47 _ = happyFail

action_48 (17) = happyShift action_14
action_48 (23) = happyShift action_50
action_48 (9) = happyGoto action_49
action_48 _ = happyFail

action_49 _ = happyReduce_8

action_50 (7) = happyGoto action_70
action_50 _ = happyReduce_5

action_51 _ = happyReduce_15

action_52 _ = happyReduce_14

action_53 (26) = happyShift action_69
action_53 _ = happyFail

action_54 (26) = happyShift action_68
action_54 _ = happyFail

action_55 _ = happyReduce_21

action_56 _ = happyReduce_20

action_57 _ = happyReduce_22

action_58 _ = happyReduce_30

action_59 _ = happyReduce_31

action_60 _ = happyReduce_32

action_61 _ = happyReduce_33

action_62 _ = happyReduce_34

action_63 _ = happyReduce_35

action_64 _ = happyReduce_36

action_65 _ = happyReduce_37

action_66 _ = happyReduce_38

action_67 _ = happyReduce_39

action_68 (23) = happyShift action_73
action_68 _ = happyFail

action_69 (23) = happyShift action_72
action_69 _ = happyFail

action_70 (17) = happyShift action_14
action_70 (19) = happyShift action_15
action_70 (20) = happyShift action_16
action_70 (21) = happyShift action_17
action_70 (22) = happyShift action_18
action_70 (24) = happyShift action_71
action_70 (25) = happyShift action_20
action_70 (27) = happyShift action_21
action_70 (47) = happyShift action_22
action_70 (48) = happyShift action_23
action_70 (49) = happyShift action_24
action_70 (50) = happyShift action_25
action_70 (51) = happyShift action_26
action_70 (52) = happyShift action_27
action_70 (53) = happyShift action_28
action_70 (54) = happyShift action_29
action_70 (8) = happyGoto action_9
action_70 (9) = happyGoto action_10
action_70 (10) = happyGoto action_11
action_70 (11) = happyGoto action_12
action_70 (12) = happyGoto action_13
action_70 _ = happyFail

action_71 _ = happyReduce_9

action_72 (7) = happyGoto action_75
action_72 _ = happyReduce_5

action_73 (7) = happyGoto action_74
action_73 _ = happyReduce_5

action_74 (17) = happyShift action_14
action_74 (19) = happyShift action_15
action_74 (20) = happyShift action_16
action_74 (21) = happyShift action_17
action_74 (22) = happyShift action_18
action_74 (24) = happyShift action_77
action_74 (25) = happyShift action_20
action_74 (27) = happyShift action_21
action_74 (47) = happyShift action_22
action_74 (48) = happyShift action_23
action_74 (49) = happyShift action_24
action_74 (50) = happyShift action_25
action_74 (51) = happyShift action_26
action_74 (52) = happyShift action_27
action_74 (53) = happyShift action_28
action_74 (54) = happyShift action_29
action_74 (8) = happyGoto action_9
action_74 (9) = happyGoto action_10
action_74 (10) = happyGoto action_11
action_74 (11) = happyGoto action_12
action_74 (12) = happyGoto action_13
action_74 _ = happyFail

action_75 (17) = happyShift action_14
action_75 (19) = happyShift action_15
action_75 (20) = happyShift action_16
action_75 (21) = happyShift action_17
action_75 (22) = happyShift action_18
action_75 (24) = happyShift action_76
action_75 (25) = happyShift action_20
action_75 (27) = happyShift action_21
action_75 (47) = happyShift action_22
action_75 (48) = happyShift action_23
action_75 (49) = happyShift action_24
action_75 (50) = happyShift action_25
action_75 (51) = happyShift action_26
action_75 (52) = happyShift action_27
action_75 (53) = happyShift action_28
action_75 (54) = happyShift action_29
action_75 (8) = happyGoto action_9
action_75 (9) = happyGoto action_10
action_75 (10) = happyGoto action_11
action_75 (11) = happyGoto action_12
action_75 (12) = happyGoto action_13
action_75 _ = happyFail

action_76 _ = happyReduce_13

action_77 _ = happyReduce_10

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
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  10 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCommand happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_2  11 happyReduction_18
happyReduction_18 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Not happy_var_2
	)
happyReduction_18 _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  11 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn11
		 (BoolExpression True
	)

happyReduce_20 = happySpecReduce_3  11 happyReduction_20
happyReduction_20 _
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn11
		 (FunctionCall happy_var_1
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  11 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_1  12 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn12
		 (Move
	)

happyReduce_24 = happySpecReduce_2  12 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Turn happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  12 happyReduction_25
happyReduction_25 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Mark happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  12 happyReduction_26
happyReduction_26 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Unmark happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  12 happyReduction_27
happyReduction_27 _
	 =  HappyAbsSyn12
		 (PickUp
	)

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn12
		 (Drop
	)

happyReduce_29 = happySpecReduce_2  12 happyReduction_29
happyReduction_29 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Flip happy_var_2
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  13 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn13
		 (Friend
	)

happyReduce_31 = happySpecReduce_1  13 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn13
		 (Foe
	)

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn13
		 (FriendWithFood
	)

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn13
		 (FoeWithFood
	)

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn13
		 (Food
	)

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn13
		 (Rock
	)

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn13
		 (Marker 0
	)

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn13
		 (FoeMarker
	)

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn13
		 (Home
	)

happyReduce_39 = happySpecReduce_1  13 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn13
		 (FoeHome
	)

happyReduce_40 = happySpecReduce_1  14 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn14
		 (IsLeft
	)

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn14
		 (IsRight
	)

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn15
		 (Here
	)

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn15
		 (Ahead
	)

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn15
		 (LeftAhead
	)

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 55 55 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 16;
	TokenIf -> cont 17;
	TokenElse -> cont 18;
	TokenWhile -> cont 19;
	TokenBreak -> cont 20;
	TokenTrue -> cont 21;
	TokenNot -> cont 22;
	TokenBraceLeft -> cont 23;
	TokenBraceRight -> cont 24;
	TokenParensLeft -> cont 25;
	TokenParensRight -> cont 26;
	TokenIdentifier happy_dollar_dollar -> cont 27;
	TokenInteger happy_dollar_dollar -> cont 28;
	TokenAnd -> cont 29;
	TokenOr -> cont 30;
	TokenHere -> cont 31;
	TokenAhead -> cont 32;
	TokenLeftAhead -> cont 33;
	TokenRightAhead -> cont 34;
	TokenLeft -> cont 35;
	TokenRight -> cont 36;
	TokenFriend -> cont 37;
	TokenFoe -> cont 38;
	TokenFriendWithFood -> cont 39;
	TokenFoeWithFood -> cont 40;
	TokenFood -> cont 41;
	TokenRock -> cont 42;
	TokenMarker -> cont 43;
	TokenFoeMarker -> cont 44;
	TokenHome -> cont 45;
	TokenFoeHome -> cont 46;
	TokenSense -> cont 47;
	TokenMark -> cont 48;
	TokenUnmark -> cont 49;
	TokenPickUp -> cont 50;
	TokenDrop -> cont 51;
	TokenTurn -> cont 52;
	TokenMove -> cont 53;
	TokenFlip -> cont 54;
	_ -> happyError' (tk:tks)
	}

happyError_ 55 tk tks = happyError' tks
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
