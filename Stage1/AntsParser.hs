{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14
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

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (15) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (54) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (26) = happyShift action_6
action_5 _ = happyFail

action_6 (22) = happyShift action_7
action_6 _ = happyFail

action_7 (7) = happyGoto action_8
action_7 _ = happyReduce_5

action_8 (16) = happyShift action_13
action_8 (18) = happyShift action_14
action_8 (19) = happyShift action_15
action_8 (20) = happyShift action_16
action_8 (21) = happyShift action_17
action_8 (23) = happyShift action_18
action_8 (24) = happyShift action_19
action_8 (26) = happyShift action_20
action_8 (46) = happyShift action_21
action_8 (47) = happyShift action_22
action_8 (48) = happyShift action_23
action_8 (49) = happyShift action_24
action_8 (50) = happyShift action_25
action_8 (51) = happyShift action_26
action_8 (52) = happyShift action_27
action_8 (53) = happyShift action_28
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 (10) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 _ = happyFail

action_9 _ = happyReduce_6

action_10 (17) = happyShift action_47
action_10 _ = happyReduce_7

action_11 _ = happyReduce_12

action_12 (28) = happyShift action_45
action_12 (29) = happyShift action_46
action_12 _ = happyReduce_16

action_13 (24) = happyShift action_44
action_13 _ = happyFail

action_14 (24) = happyShift action_43
action_14 _ = happyFail

action_15 _ = happyReduce_11

action_16 _ = happyReduce_26

action_17 (20) = happyShift action_16
action_17 (21) = happyShift action_17
action_17 (24) = happyShift action_19
action_17 (26) = happyShift action_20
action_17 (46) = happyShift action_21
action_17 (47) = happyShift action_22
action_17 (48) = happyShift action_23
action_17 (49) = happyShift action_24
action_17 (50) = happyShift action_25
action_17 (51) = happyShift action_26
action_17 (52) = happyShift action_27
action_17 (53) = happyShift action_28
action_17 (11) = happyGoto action_42
action_17 _ = happyFail

action_18 _ = happyReduce_4

action_19 (20) = happyShift action_16
action_19 (21) = happyShift action_17
action_19 (24) = happyShift action_19
action_19 (26) = happyShift action_20
action_19 (46) = happyShift action_21
action_19 (47) = happyShift action_22
action_19 (48) = happyShift action_23
action_19 (49) = happyShift action_24
action_19 (50) = happyShift action_25
action_19 (51) = happyShift action_26
action_19 (52) = happyShift action_27
action_19 (53) = happyShift action_28
action_19 (10) = happyGoto action_41
action_19 (11) = happyGoto action_12
action_19 _ = happyFail

action_20 (24) = happyShift action_40
action_20 _ = happyFail

action_21 (30) = happyShift action_36
action_21 (31) = happyShift action_37
action_21 (32) = happyShift action_38
action_21 (33) = happyShift action_39
action_21 (14) = happyGoto action_35
action_21 _ = happyFail

action_22 (27) = happyShift action_34
action_22 _ = happyFail

action_23 (27) = happyShift action_33
action_23 _ = happyFail

action_24 _ = happyReduce_22

action_25 _ = happyReduce_23

action_26 (34) = happyShift action_31
action_26 (35) = happyShift action_32
action_26 (13) = happyGoto action_30
action_26 _ = happyFail

action_27 _ = happyReduce_18

action_28 (27) = happyShift action_29
action_28 _ = happyFail

action_29 _ = happyReduce_24

action_30 _ = happyReduce_19

action_31 _ = happyReduce_39

action_32 _ = happyReduce_40

action_33 _ = happyReduce_21

action_34 _ = happyReduce_20

action_35 (36) = happyShift action_57
action_35 (37) = happyShift action_58
action_35 (38) = happyShift action_59
action_35 (39) = happyShift action_60
action_35 (40) = happyShift action_61
action_35 (41) = happyShift action_62
action_35 (42) = happyShift action_63
action_35 (43) = happyShift action_64
action_35 (44) = happyShift action_65
action_35 (45) = happyShift action_66
action_35 (12) = happyGoto action_56
action_35 _ = happyFail

action_36 _ = happyReduce_41

action_37 _ = happyReduce_42

action_38 _ = happyReduce_43

action_39 _ = happyReduce_44

action_40 (25) = happyShift action_55
action_40 _ = happyFail

action_41 (25) = happyShift action_54
action_41 _ = happyFail

action_42 _ = happyReduce_25

action_43 (20) = happyShift action_16
action_43 (21) = happyShift action_17
action_43 (24) = happyShift action_19
action_43 (26) = happyShift action_20
action_43 (46) = happyShift action_21
action_43 (47) = happyShift action_22
action_43 (48) = happyShift action_23
action_43 (49) = happyShift action_24
action_43 (50) = happyShift action_25
action_43 (51) = happyShift action_26
action_43 (52) = happyShift action_27
action_43 (53) = happyShift action_28
action_43 (10) = happyGoto action_53
action_43 (11) = happyGoto action_12
action_43 _ = happyFail

action_44 (20) = happyShift action_16
action_44 (21) = happyShift action_17
action_44 (24) = happyShift action_19
action_44 (26) = happyShift action_20
action_44 (46) = happyShift action_21
action_44 (47) = happyShift action_22
action_44 (48) = happyShift action_23
action_44 (49) = happyShift action_24
action_44 (50) = happyShift action_25
action_44 (51) = happyShift action_26
action_44 (52) = happyShift action_27
action_44 (53) = happyShift action_28
action_44 (10) = happyGoto action_52
action_44 (11) = happyGoto action_12
action_44 _ = happyFail

action_45 (20) = happyShift action_16
action_45 (21) = happyShift action_17
action_45 (24) = happyShift action_19
action_45 (26) = happyShift action_20
action_45 (46) = happyShift action_21
action_45 (47) = happyShift action_22
action_45 (48) = happyShift action_23
action_45 (49) = happyShift action_24
action_45 (50) = happyShift action_25
action_45 (51) = happyShift action_26
action_45 (52) = happyShift action_27
action_45 (53) = happyShift action_28
action_45 (10) = happyGoto action_51
action_45 (11) = happyGoto action_12
action_45 _ = happyFail

action_46 (20) = happyShift action_16
action_46 (21) = happyShift action_17
action_46 (24) = happyShift action_19
action_46 (26) = happyShift action_20
action_46 (46) = happyShift action_21
action_46 (47) = happyShift action_22
action_46 (48) = happyShift action_23
action_46 (49) = happyShift action_24
action_46 (50) = happyShift action_25
action_46 (51) = happyShift action_26
action_46 (52) = happyShift action_27
action_46 (53) = happyShift action_28
action_46 (10) = happyGoto action_50
action_46 (11) = happyGoto action_12
action_46 _ = happyFail

action_47 (16) = happyShift action_13
action_47 (22) = happyShift action_49
action_47 (9) = happyGoto action_48
action_47 _ = happyFail

action_48 _ = happyReduce_8

action_49 (7) = happyGoto action_69
action_49 _ = happyReduce_5

action_50 _ = happyReduce_15

action_51 _ = happyReduce_14

action_52 (25) = happyShift action_68
action_52 _ = happyFail

action_53 (25) = happyShift action_67
action_53 _ = happyFail

action_54 _ = happyReduce_28

action_55 _ = happyReduce_27

action_56 _ = happyReduce_17

action_57 _ = happyReduce_29

action_58 _ = happyReduce_30

action_59 _ = happyReduce_31

action_60 _ = happyReduce_32

action_61 _ = happyReduce_33

action_62 _ = happyReduce_34

action_63 _ = happyReduce_35

action_64 _ = happyReduce_36

action_65 _ = happyReduce_37

action_66 _ = happyReduce_38

action_67 (22) = happyShift action_72
action_67 _ = happyFail

action_68 (22) = happyShift action_71
action_68 _ = happyFail

action_69 (16) = happyShift action_13
action_69 (18) = happyShift action_14
action_69 (19) = happyShift action_15
action_69 (20) = happyShift action_16
action_69 (21) = happyShift action_17
action_69 (23) = happyShift action_70
action_69 (24) = happyShift action_19
action_69 (26) = happyShift action_20
action_69 (46) = happyShift action_21
action_69 (47) = happyShift action_22
action_69 (48) = happyShift action_23
action_69 (49) = happyShift action_24
action_69 (50) = happyShift action_25
action_69 (51) = happyShift action_26
action_69 (52) = happyShift action_27
action_69 (53) = happyShift action_28
action_69 (8) = happyGoto action_9
action_69 (9) = happyGoto action_10
action_69 (10) = happyGoto action_11
action_69 (11) = happyGoto action_12
action_69 _ = happyFail

action_70 _ = happyReduce_9

action_71 (7) = happyGoto action_74
action_71 _ = happyReduce_5

action_72 (7) = happyGoto action_73
action_72 _ = happyReduce_5

action_73 (16) = happyShift action_13
action_73 (18) = happyShift action_14
action_73 (19) = happyShift action_15
action_73 (20) = happyShift action_16
action_73 (21) = happyShift action_17
action_73 (23) = happyShift action_76
action_73 (24) = happyShift action_19
action_73 (26) = happyShift action_20
action_73 (46) = happyShift action_21
action_73 (47) = happyShift action_22
action_73 (48) = happyShift action_23
action_73 (49) = happyShift action_24
action_73 (50) = happyShift action_25
action_73 (51) = happyShift action_26
action_73 (52) = happyShift action_27
action_73 (53) = happyShift action_28
action_73 (8) = happyGoto action_9
action_73 (9) = happyGoto action_10
action_73 (10) = happyGoto action_11
action_73 (11) = happyGoto action_12
action_73 _ = happyFail

action_74 (16) = happyShift action_13
action_74 (18) = happyShift action_14
action_74 (19) = happyShift action_15
action_74 (20) = happyShift action_16
action_74 (21) = happyShift action_17
action_74 (23) = happyShift action_75
action_74 (24) = happyShift action_19
action_74 (26) = happyShift action_20
action_74 (46) = happyShift action_21
action_74 (47) = happyShift action_22
action_74 (48) = happyShift action_23
action_74 (49) = happyShift action_24
action_74 (50) = happyShift action_25
action_74 (51) = happyShift action_26
action_74 (52) = happyShift action_27
action_74 (53) = happyShift action_28
action_74 (8) = happyGoto action_9
action_74 (9) = happyGoto action_10
action_74 (10) = happyGoto action_11
action_74 (11) = happyGoto action_12
action_74 _ = happyFail

action_75 _ = happyReduce_13

action_76 _ = happyReduce_10

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

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 _
	 =  HappyAbsSyn11
		 (Move
	)

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Turn happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  11 happyReduction_20
happyReduction_20 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn11
		 (Mark happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  11 happyReduction_21
happyReduction_21 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn11
		 (Unmark happy_var_2
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn11
		 (PickUp
	)

happyReduce_23 = happySpecReduce_1  11 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn11
		 (Drop
	)

happyReduce_24 = happySpecReduce_2  11 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn11
		 (Flip happy_var_2
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  11 happyReduction_25
happyReduction_25 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Not happy_var_2
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  11 happyReduction_26
happyReduction_26 _
	 =  HappyAbsSyn11
		 (BoolExpression True
	)

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 _
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn11
		 (FunctionCall happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn12
		 (Friend
	)

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (Foe
	)

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn12
		 (FriendWithFood
	)

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn12
		 (FoeWithFood
	)

happyReduce_33 = happySpecReduce_1  12 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn12
		 (Food
	)

happyReduce_34 = happySpecReduce_1  12 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn12
		 (Rock
	)

happyReduce_35 = happySpecReduce_1  12 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn12
		 (Marker 0
	)

happyReduce_36 = happySpecReduce_1  12 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn12
		 (FoeMarker
	)

happyReduce_37 = happySpecReduce_1  12 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn12
		 (Home
	)

happyReduce_38 = happySpecReduce_1  12 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn12
		 (FoeHome
	)

happyReduce_39 = happySpecReduce_1  13 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn13
		 (IsLeft
	)

happyReduce_40 = happySpecReduce_1  13 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn13
		 (IsRight
	)

happyReduce_41 = happySpecReduce_1  14 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn14
		 (Here
	)

happyReduce_42 = happySpecReduce_1  14 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn14
		 (Ahead
	)

happyReduce_43 = happySpecReduce_1  14 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn14
		 (LeftAhead
	)

happyReduce_44 = happySpecReduce_1  14 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn14
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 54 54 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 15;
	TokenIf -> cont 16;
	TokenElse -> cont 17;
	TokenWhile -> cont 18;
	TokenBreak -> cont 19;
	TokenTrue -> cont 20;
	TokenNot -> cont 21;
	TokenBraceLeft -> cont 22;
	TokenBraceRight -> cont 23;
	TokenParensLeft -> cont 24;
	TokenParensRight -> cont 25;
	TokenIdentifier happy_dollar_dollar -> cont 26;
	TokenInteger happy_dollar_dollar -> cont 27;
	TokenAnd -> cont 28;
	TokenOr -> cont 29;
	TokenHere -> cont 30;
	TokenAhead -> cont 31;
	TokenLeftAhead -> cont 32;
	TokenRightAhead -> cont 33;
	TokenLeft -> cont 34;
	TokenRight -> cont 35;
	TokenFriend -> cont 36;
	TokenFoe -> cont 37;
	TokenFriendWithFood -> cont 38;
	TokenFoeWithFood -> cont 39;
	TokenFood -> cont 40;
	TokenRock -> cont 41;
	TokenMarker -> cont 42;
	TokenFoeMarker -> cont 43;
	TokenHome -> cont 44;
	TokenFoeHome -> cont 45;
	TokenSense -> cont 46;
	TokenMark -> cont 47;
	TokenUnmark -> cont 48;
	TokenPickUp -> cont 49;
	TokenDrop -> cont 50;
	TokenTurn -> cont 51;
	TokenMove -> cont 52;
	TokenFlip -> cont 53;
	_ -> happyError' (tk:tks)
	}

happyError_ 54 tk tks = happyError' tks
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
