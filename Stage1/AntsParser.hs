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

action_3 (58) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (29) = happyShift action_6
action_5 _ = happyFail

action_6 (25) = happyShift action_7
action_6 _ = happyFail

action_7 (7) = happyGoto action_8
action_7 _ = happyReduce_5

action_8 (17) = happyShift action_14
action_8 (19) = happyShift action_15
action_8 (20) = happyShift action_16
action_8 (21) = happyShift action_17
action_8 (22) = happyShift action_18
action_8 (24) = happyShift action_19
action_8 (26) = happyShift action_20
action_8 (27) = happyShift action_21
action_8 (29) = happyShift action_22
action_8 (50) = happyShift action_23
action_8 (51) = happyShift action_24
action_8 (52) = happyShift action_25
action_8 (53) = happyShift action_26
action_8 (54) = happyShift action_27
action_8 (55) = happyShift action_28
action_8 (56) = happyShift action_29
action_8 (57) = happyShift action_30
action_8 (8) = happyGoto action_9
action_8 (9) = happyGoto action_10
action_8 (10) = happyGoto action_11
action_8 (11) = happyGoto action_12
action_8 (12) = happyGoto action_13
action_8 _ = happyFail

action_9 _ = happyReduce_6

action_10 (18) = happyShift action_51
action_10 _ = happyReduce_7

action_11 _ = happyReduce_12

action_12 (31) = happyShift action_49
action_12 (32) = happyShift action_50
action_12 _ = happyReduce_17

action_13 _ = happyReduce_18

action_14 (27) = happyShift action_48
action_14 _ = happyFail

action_15 (27) = happyShift action_47
action_15 _ = happyFail

action_16 _ = happyReduce_11

action_17 _ = happyReduce_20

action_18 (27) = happyShift action_46
action_18 _ = happyFail

action_19 (21) = happyShift action_17
action_19 (24) = happyShift action_19
action_19 (27) = happyShift action_21
action_19 (29) = happyShift action_22
action_19 (50) = happyShift action_23
action_19 (51) = happyShift action_24
action_19 (52) = happyShift action_25
action_19 (53) = happyShift action_26
action_19 (54) = happyShift action_27
action_19 (55) = happyShift action_28
action_19 (56) = happyShift action_29
action_19 (57) = happyShift action_30
action_19 (11) = happyGoto action_45
action_19 (12) = happyGoto action_13
action_19 _ = happyFail

action_20 _ = happyReduce_4

action_21 (21) = happyShift action_17
action_21 (24) = happyShift action_19
action_21 (27) = happyShift action_21
action_21 (29) = happyShift action_22
action_21 (50) = happyShift action_23
action_21 (51) = happyShift action_24
action_21 (52) = happyShift action_25
action_21 (53) = happyShift action_26
action_21 (54) = happyShift action_27
action_21 (55) = happyShift action_28
action_21 (56) = happyShift action_29
action_21 (57) = happyShift action_30
action_21 (10) = happyGoto action_44
action_21 (11) = happyGoto action_12
action_21 (12) = happyGoto action_13
action_21 _ = happyFail

action_22 (27) = happyShift action_42
action_22 (33) = happyShift action_43
action_22 _ = happyFail

action_23 (34) = happyShift action_38
action_23 (35) = happyShift action_39
action_23 (36) = happyShift action_40
action_23 (37) = happyShift action_41
action_23 (15) = happyGoto action_37
action_23 _ = happyFail

action_24 (30) = happyShift action_36
action_24 _ = happyFail

action_25 (30) = happyShift action_35
action_25 _ = happyFail

action_26 _ = happyReduce_29

action_27 _ = happyReduce_30

action_28 (38) = happyShift action_33
action_28 (39) = happyShift action_34
action_28 (14) = happyGoto action_32
action_28 _ = happyFail

action_29 _ = happyReduce_25

action_30 (30) = happyShift action_31
action_30 _ = happyFail

action_31 _ = happyReduce_31

action_32 _ = happyReduce_26

action_33 _ = happyReduce_42

action_34 _ = happyReduce_43

action_35 _ = happyReduce_28

action_36 _ = happyReduce_27

action_37 (40) = happyShift action_63
action_37 (41) = happyShift action_64
action_37 (42) = happyShift action_65
action_37 (43) = happyShift action_66
action_37 (44) = happyShift action_67
action_37 (45) = happyShift action_68
action_37 (46) = happyShift action_69
action_37 (47) = happyShift action_70
action_37 (48) = happyShift action_71
action_37 (49) = happyShift action_72
action_37 (13) = happyGoto action_62
action_37 _ = happyFail

action_38 _ = happyReduce_44

action_39 _ = happyReduce_45

action_40 _ = happyReduce_46

action_41 _ = happyReduce_47

action_42 (28) = happyShift action_61
action_42 _ = happyFail

action_43 (30) = happyShift action_60
action_43 _ = happyFail

action_44 (28) = happyShift action_59
action_44 _ = happyFail

action_45 _ = happyReduce_19

action_46 (29) = happyShift action_58
action_46 _ = happyFail

action_47 (21) = happyShift action_17
action_47 (24) = happyShift action_19
action_47 (27) = happyShift action_21
action_47 (29) = happyShift action_22
action_47 (50) = happyShift action_23
action_47 (51) = happyShift action_24
action_47 (52) = happyShift action_25
action_47 (53) = happyShift action_26
action_47 (54) = happyShift action_27
action_47 (55) = happyShift action_28
action_47 (56) = happyShift action_29
action_47 (57) = happyShift action_30
action_47 (10) = happyGoto action_57
action_47 (11) = happyGoto action_12
action_47 (12) = happyGoto action_13
action_47 _ = happyFail

action_48 (21) = happyShift action_17
action_48 (24) = happyShift action_19
action_48 (27) = happyShift action_21
action_48 (29) = happyShift action_22
action_48 (50) = happyShift action_23
action_48 (51) = happyShift action_24
action_48 (52) = happyShift action_25
action_48 (53) = happyShift action_26
action_48 (54) = happyShift action_27
action_48 (55) = happyShift action_28
action_48 (56) = happyShift action_29
action_48 (57) = happyShift action_30
action_48 (10) = happyGoto action_56
action_48 (11) = happyGoto action_12
action_48 (12) = happyGoto action_13
action_48 _ = happyFail

action_49 (21) = happyShift action_17
action_49 (24) = happyShift action_19
action_49 (27) = happyShift action_21
action_49 (29) = happyShift action_22
action_49 (50) = happyShift action_23
action_49 (51) = happyShift action_24
action_49 (52) = happyShift action_25
action_49 (53) = happyShift action_26
action_49 (54) = happyShift action_27
action_49 (55) = happyShift action_28
action_49 (56) = happyShift action_29
action_49 (57) = happyShift action_30
action_49 (10) = happyGoto action_55
action_49 (11) = happyGoto action_12
action_49 (12) = happyGoto action_13
action_49 _ = happyFail

action_50 (21) = happyShift action_17
action_50 (24) = happyShift action_19
action_50 (27) = happyShift action_21
action_50 (29) = happyShift action_22
action_50 (50) = happyShift action_23
action_50 (51) = happyShift action_24
action_50 (52) = happyShift action_25
action_50 (53) = happyShift action_26
action_50 (54) = happyShift action_27
action_50 (55) = happyShift action_28
action_50 (56) = happyShift action_29
action_50 (57) = happyShift action_30
action_50 (10) = happyGoto action_54
action_50 (11) = happyGoto action_12
action_50 (12) = happyGoto action_13
action_50 _ = happyFail

action_51 (17) = happyShift action_14
action_51 (25) = happyShift action_53
action_51 (9) = happyGoto action_52
action_51 _ = happyFail

action_52 _ = happyReduce_8

action_53 (7) = happyGoto action_76
action_53 _ = happyReduce_5

action_54 _ = happyReduce_16

action_55 _ = happyReduce_15

action_56 (28) = happyShift action_75
action_56 _ = happyFail

action_57 (28) = happyShift action_74
action_57 _ = happyFail

action_58 (23) = happyShift action_73
action_58 _ = happyFail

action_59 _ = happyReduce_22

action_60 _ = happyReduce_23

action_61 _ = happyReduce_21

action_62 _ = happyReduce_24

action_63 _ = happyReduce_32

action_64 _ = happyReduce_33

action_65 _ = happyReduce_34

action_66 _ = happyReduce_35

action_67 _ = happyReduce_36

action_68 _ = happyReduce_37

action_69 _ = happyReduce_38

action_70 _ = happyReduce_39

action_71 _ = happyReduce_40

action_72 _ = happyReduce_41

action_73 (30) = happyShift action_80
action_73 _ = happyFail

action_74 (25) = happyShift action_79
action_74 _ = happyFail

action_75 (25) = happyShift action_78
action_75 _ = happyFail

action_76 (17) = happyShift action_14
action_76 (19) = happyShift action_15
action_76 (20) = happyShift action_16
action_76 (21) = happyShift action_17
action_76 (22) = happyShift action_18
action_76 (24) = happyShift action_19
action_76 (26) = happyShift action_77
action_76 (27) = happyShift action_21
action_76 (29) = happyShift action_22
action_76 (50) = happyShift action_23
action_76 (51) = happyShift action_24
action_76 (52) = happyShift action_25
action_76 (53) = happyShift action_26
action_76 (54) = happyShift action_27
action_76 (55) = happyShift action_28
action_76 (56) = happyShift action_29
action_76 (57) = happyShift action_30
action_76 (8) = happyGoto action_9
action_76 (9) = happyGoto action_10
action_76 (10) = happyGoto action_11
action_76 (11) = happyGoto action_12
action_76 (12) = happyGoto action_13
action_76 _ = happyFail

action_77 _ = happyReduce_9

action_78 (7) = happyGoto action_83
action_78 _ = happyReduce_5

action_79 (7) = happyGoto action_82
action_79 _ = happyReduce_5

action_80 (28) = happyShift action_81
action_80 _ = happyFail

action_81 (25) = happyShift action_86
action_81 _ = happyFail

action_82 (17) = happyShift action_14
action_82 (19) = happyShift action_15
action_82 (20) = happyShift action_16
action_82 (21) = happyShift action_17
action_82 (22) = happyShift action_18
action_82 (24) = happyShift action_19
action_82 (26) = happyShift action_85
action_82 (27) = happyShift action_21
action_82 (29) = happyShift action_22
action_82 (50) = happyShift action_23
action_82 (51) = happyShift action_24
action_82 (52) = happyShift action_25
action_82 (53) = happyShift action_26
action_82 (54) = happyShift action_27
action_82 (55) = happyShift action_28
action_82 (56) = happyShift action_29
action_82 (57) = happyShift action_30
action_82 (8) = happyGoto action_9
action_82 (9) = happyGoto action_10
action_82 (10) = happyGoto action_11
action_82 (11) = happyGoto action_12
action_82 (12) = happyGoto action_13
action_82 _ = happyFail

action_83 (17) = happyShift action_14
action_83 (19) = happyShift action_15
action_83 (20) = happyShift action_16
action_83 (21) = happyShift action_17
action_83 (22) = happyShift action_18
action_83 (24) = happyShift action_19
action_83 (26) = happyShift action_84
action_83 (27) = happyShift action_21
action_83 (29) = happyShift action_22
action_83 (50) = happyShift action_23
action_83 (51) = happyShift action_24
action_83 (52) = happyShift action_25
action_83 (53) = happyShift action_26
action_83 (54) = happyShift action_27
action_83 (55) = happyShift action_28
action_83 (56) = happyShift action_29
action_83 (57) = happyShift action_30
action_83 (8) = happyGoto action_9
action_83 (9) = happyGoto action_10
action_83 (10) = happyGoto action_11
action_83 (11) = happyGoto action_12
action_83 (12) = happyGoto action_13
action_83 _ = happyFail

action_84 _ = happyReduce_14

action_85 _ = happyReduce_10

action_86 (7) = happyGoto action_87
action_86 _ = happyReduce_5

action_87 (17) = happyShift action_14
action_87 (19) = happyShift action_15
action_87 (20) = happyShift action_16
action_87 (21) = happyShift action_17
action_87 (22) = happyShift action_18
action_87 (24) = happyShift action_19
action_87 (26) = happyShift action_88
action_87 (27) = happyShift action_21
action_87 (29) = happyShift action_22
action_87 (50) = happyShift action_23
action_87 (51) = happyShift action_24
action_87 (52) = happyShift action_25
action_87 (53) = happyShift action_26
action_87 (54) = happyShift action_27
action_87 (55) = happyShift action_28
action_87 (56) = happyShift action_29
action_87 (57) = happyShift action_30
action_87 (8) = happyGoto action_9
action_87 (9) = happyGoto action_10
action_87 (10) = happyGoto action_11
action_87 (11) = happyGoto action_12
action_87 (12) = happyGoto action_13
action_87 _ = happyFail

action_88 _ = happyReduce_13

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

happyReduce_13 = happyReduce 9 8 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenInteger happy_var_5)) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Times happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 7 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
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

happyReduce_15 = happySpecReduce_3  10 happyReduction_15
happyReduction_15 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (And happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  10 happyReduction_16
happyReduction_16 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (Or happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  10 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (ExpressionCommand happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Not happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  11 happyReduction_20
happyReduction_20 _
	 =  HappyAbsSyn11
		 (BoolExpression True
	)

happyReduce_21 = happySpecReduce_3  11 happyReduction_21
happyReduction_21 _
	_
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn11
		 (FunctionCall happy_var_1
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (happy_var_2
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyTerminal (TokenInteger happy_var_3))
	(HappyTerminal (TokenComparison happy_var_2))
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn11
		 (Comparison happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  12 happyReduction_25
happyReduction_25 _
	 =  HappyAbsSyn12
		 (Move
	)

happyReduce_26 = happySpecReduce_2  12 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Turn happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  12 happyReduction_27
happyReduction_27 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Mark happy_var_2
	)
happyReduction_27 _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  12 happyReduction_28
happyReduction_28 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Unmark happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn12
		 (PickUp
	)

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn12
		 (Drop
	)

happyReduce_31 = happySpecReduce_2  12 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn12
		 (Flip happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  13 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn13
		 (Friend
	)

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn13
		 (Foe
	)

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn13
		 (FriendWithFood
	)

happyReduce_35 = happySpecReduce_1  13 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn13
		 (FoeWithFood
	)

happyReduce_36 = happySpecReduce_1  13 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn13
		 (Food
	)

happyReduce_37 = happySpecReduce_1  13 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn13
		 (Rock
	)

happyReduce_38 = happySpecReduce_1  13 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn13
		 (Marker 0
	)

happyReduce_39 = happySpecReduce_1  13 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn13
		 (FoeMarker
	)

happyReduce_40 = happySpecReduce_1  13 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn13
		 (Home
	)

happyReduce_41 = happySpecReduce_1  13 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn13
		 (FoeHome
	)

happyReduce_42 = happySpecReduce_1  14 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn14
		 (IsLeft
	)

happyReduce_43 = happySpecReduce_1  14 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn14
		 (IsRight
	)

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn15
		 (Here
	)

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (Ahead
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (LeftAhead
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn15
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 58 58 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 16;
	TokenIf -> cont 17;
	TokenElse -> cont 18;
	TokenWhile -> cont 19;
	TokenBreak -> cont 20;
	TokenTrue -> cont 21;
	TokenTimes -> cont 22;
	TokenComma -> cont 23;
	TokenNot -> cont 24;
	TokenBraceLeft -> cont 25;
	TokenBraceRight -> cont 26;
	TokenParensLeft -> cont 27;
	TokenParensRight -> cont 28;
	TokenIdentifier happy_dollar_dollar -> cont 29;
	TokenInteger happy_dollar_dollar -> cont 30;
	TokenAnd -> cont 31;
	TokenOr -> cont 32;
	TokenComparison happy_dollar_dollar -> cont 33;
	TokenHere -> cont 34;
	TokenAhead -> cont 35;
	TokenLeftAhead -> cont 36;
	TokenRightAhead -> cont 37;
	TokenLeft -> cont 38;
	TokenRight -> cont 39;
	TokenFriend -> cont 40;
	TokenFoe -> cont 41;
	TokenFriendWithFood -> cont 42;
	TokenFoeWithFood -> cont 43;
	TokenFood -> cont 44;
	TokenRock -> cont 45;
	TokenMarker -> cont 46;
	TokenFoeMarker -> cont 47;
	TokenHome -> cont 48;
	TokenFoeHome -> cont 49;
	TokenSense -> cont 50;
	TokenMark -> cont 51;
	TokenUnmark -> cont 52;
	TokenPickUp -> cont 53;
	TokenDrop -> cont 54;
	TokenTurn -> cont 55;
	TokenMove -> cont 56;
	TokenFlip -> cont 57;
	_ -> happyError' (tk:tks)
	}

happyError_ 58 tk tks = happyError' tks
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
