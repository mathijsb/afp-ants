{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17
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
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (18) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (60) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (31) = happyShift action_6
action_5 _ = happyFail

action_6 (29) = happyShift action_7
action_6 _ = happyFail

action_7 (31) = happyShift action_9
action_7 (12) = happyGoto action_8
action_7 _ = happyReduce_24

action_8 (25) = happyShift action_10
action_8 (30) = happyShift action_11
action_8 _ = happyFail

action_9 _ = happyReduce_26

action_10 (31) = happyShift action_13
action_10 _ = happyFail

action_11 (27) = happyShift action_12
action_11 _ = happyFail

action_12 (7) = happyGoto action_14
action_12 _ = happyReduce_5

action_13 _ = happyReduce_25

action_14 (19) = happyShift action_20
action_14 (21) = happyShift action_21
action_14 (22) = happyShift action_22
action_14 (23) = happyShift action_23
action_14 (24) = happyShift action_24
action_14 (26) = happyShift action_25
action_14 (28) = happyShift action_26
action_14 (29) = happyShift action_27
action_14 (31) = happyShift action_28
action_14 (52) = happyShift action_29
action_14 (53) = happyShift action_30
action_14 (54) = happyShift action_31
action_14 (55) = happyShift action_32
action_14 (56) = happyShift action_33
action_14 (57) = happyShift action_34
action_14 (58) = happyShift action_35
action_14 (59) = happyShift action_36
action_14 (8) = happyGoto action_15
action_14 (9) = happyGoto action_16
action_14 (10) = happyGoto action_17
action_14 (11) = happyGoto action_18
action_14 (14) = happyGoto action_19
action_14 _ = happyFail

action_15 _ = happyReduce_6

action_16 (20) = happyShift action_57
action_16 _ = happyReduce_7

action_17 _ = happyReduce_12

action_18 (33) = happyShift action_55
action_18 (34) = happyShift action_56
action_18 _ = happyReduce_17

action_19 _ = happyReduce_18

action_20 (29) = happyShift action_54
action_20 _ = happyFail

action_21 (29) = happyShift action_53
action_21 _ = happyFail

action_22 _ = happyReduce_11

action_23 _ = happyReduce_20

action_24 (29) = happyShift action_52
action_24 _ = happyFail

action_25 (23) = happyShift action_23
action_25 (26) = happyShift action_25
action_25 (29) = happyShift action_27
action_25 (31) = happyShift action_28
action_25 (52) = happyShift action_29
action_25 (53) = happyShift action_30
action_25 (54) = happyShift action_31
action_25 (55) = happyShift action_32
action_25 (56) = happyShift action_33
action_25 (57) = happyShift action_34
action_25 (58) = happyShift action_35
action_25 (59) = happyShift action_36
action_25 (11) = happyGoto action_51
action_25 (14) = happyGoto action_19
action_25 _ = happyFail

action_26 _ = happyReduce_4

action_27 (23) = happyShift action_23
action_27 (26) = happyShift action_25
action_27 (29) = happyShift action_27
action_27 (31) = happyShift action_28
action_27 (52) = happyShift action_29
action_27 (53) = happyShift action_30
action_27 (54) = happyShift action_31
action_27 (55) = happyShift action_32
action_27 (56) = happyShift action_33
action_27 (57) = happyShift action_34
action_27 (58) = happyShift action_35
action_27 (59) = happyShift action_36
action_27 (10) = happyGoto action_50
action_27 (11) = happyGoto action_18
action_27 (14) = happyGoto action_19
action_27 _ = happyFail

action_28 (29) = happyShift action_48
action_28 (35) = happyShift action_49
action_28 _ = happyFail

action_29 (36) = happyShift action_44
action_29 (37) = happyShift action_45
action_29 (38) = happyShift action_46
action_29 (39) = happyShift action_47
action_29 (17) = happyGoto action_43
action_29 _ = happyFail

action_30 (32) = happyShift action_42
action_30 _ = happyFail

action_31 (32) = happyShift action_41
action_31 _ = happyFail

action_32 _ = happyReduce_35

action_33 _ = happyReduce_36

action_34 (40) = happyShift action_39
action_34 (41) = happyShift action_40
action_34 (16) = happyGoto action_38
action_34 _ = happyFail

action_35 _ = happyReduce_31

action_36 (32) = happyShift action_37
action_36 _ = happyFail

action_37 _ = happyReduce_37

action_38 _ = happyReduce_32

action_39 _ = happyReduce_48

action_40 _ = happyReduce_49

action_41 _ = happyReduce_34

action_42 _ = happyReduce_33

action_43 (42) = happyShift action_70
action_43 (43) = happyShift action_71
action_43 (44) = happyShift action_72
action_43 (45) = happyShift action_73
action_43 (46) = happyShift action_74
action_43 (47) = happyShift action_75
action_43 (48) = happyShift action_76
action_43 (49) = happyShift action_77
action_43 (50) = happyShift action_78
action_43 (51) = happyShift action_79
action_43 (15) = happyGoto action_69
action_43 _ = happyFail

action_44 _ = happyReduce_50

action_45 _ = happyReduce_51

action_46 _ = happyReduce_52

action_47 _ = happyReduce_53

action_48 (32) = happyShift action_68
action_48 (13) = happyGoto action_67
action_48 _ = happyReduce_27

action_49 (32) = happyShift action_66
action_49 _ = happyFail

action_50 (30) = happyShift action_65
action_50 _ = happyFail

action_51 _ = happyReduce_19

action_52 (31) = happyShift action_64
action_52 _ = happyFail

action_53 (23) = happyShift action_23
action_53 (26) = happyShift action_25
action_53 (29) = happyShift action_27
action_53 (31) = happyShift action_28
action_53 (52) = happyShift action_29
action_53 (53) = happyShift action_30
action_53 (54) = happyShift action_31
action_53 (55) = happyShift action_32
action_53 (56) = happyShift action_33
action_53 (57) = happyShift action_34
action_53 (58) = happyShift action_35
action_53 (59) = happyShift action_36
action_53 (10) = happyGoto action_63
action_53 (11) = happyGoto action_18
action_53 (14) = happyGoto action_19
action_53 _ = happyFail

action_54 (23) = happyShift action_23
action_54 (26) = happyShift action_25
action_54 (29) = happyShift action_27
action_54 (31) = happyShift action_28
action_54 (52) = happyShift action_29
action_54 (53) = happyShift action_30
action_54 (54) = happyShift action_31
action_54 (55) = happyShift action_32
action_54 (56) = happyShift action_33
action_54 (57) = happyShift action_34
action_54 (58) = happyShift action_35
action_54 (59) = happyShift action_36
action_54 (10) = happyGoto action_62
action_54 (11) = happyGoto action_18
action_54 (14) = happyGoto action_19
action_54 _ = happyFail

action_55 (23) = happyShift action_23
action_55 (26) = happyShift action_25
action_55 (29) = happyShift action_27
action_55 (31) = happyShift action_28
action_55 (52) = happyShift action_29
action_55 (53) = happyShift action_30
action_55 (54) = happyShift action_31
action_55 (55) = happyShift action_32
action_55 (56) = happyShift action_33
action_55 (57) = happyShift action_34
action_55 (58) = happyShift action_35
action_55 (59) = happyShift action_36
action_55 (10) = happyGoto action_61
action_55 (11) = happyGoto action_18
action_55 (14) = happyGoto action_19
action_55 _ = happyFail

action_56 (23) = happyShift action_23
action_56 (26) = happyShift action_25
action_56 (29) = happyShift action_27
action_56 (31) = happyShift action_28
action_56 (52) = happyShift action_29
action_56 (53) = happyShift action_30
action_56 (54) = happyShift action_31
action_56 (55) = happyShift action_32
action_56 (56) = happyShift action_33
action_56 (57) = happyShift action_34
action_56 (58) = happyShift action_35
action_56 (59) = happyShift action_36
action_56 (10) = happyGoto action_60
action_56 (11) = happyGoto action_18
action_56 (14) = happyGoto action_19
action_56 _ = happyFail

action_57 (19) = happyShift action_20
action_57 (27) = happyShift action_59
action_57 (9) = happyGoto action_58
action_57 _ = happyFail

action_58 _ = happyReduce_8

action_59 (7) = happyGoto action_85
action_59 _ = happyReduce_5

action_60 _ = happyReduce_16

action_61 _ = happyReduce_15

action_62 (30) = happyShift action_84
action_62 _ = happyFail

action_63 (30) = happyShift action_83
action_63 _ = happyFail

action_64 (25) = happyShift action_82
action_64 _ = happyFail

action_65 _ = happyReduce_22

action_66 _ = happyReduce_23

action_67 (25) = happyShift action_80
action_67 (30) = happyShift action_81
action_67 _ = happyFail

action_68 _ = happyReduce_29

action_69 _ = happyReduce_30

action_70 _ = happyReduce_38

action_71 _ = happyReduce_39

action_72 _ = happyReduce_40

action_73 _ = happyReduce_41

action_74 _ = happyReduce_42

action_75 _ = happyReduce_43

action_76 _ = happyReduce_44

action_77 _ = happyReduce_45

action_78 _ = happyReduce_46

action_79 _ = happyReduce_47

action_80 (32) = happyShift action_90
action_80 _ = happyFail

action_81 _ = happyReduce_21

action_82 (32) = happyShift action_89
action_82 _ = happyFail

action_83 (27) = happyShift action_88
action_83 _ = happyFail

action_84 (27) = happyShift action_87
action_84 _ = happyFail

action_85 (19) = happyShift action_20
action_85 (21) = happyShift action_21
action_85 (22) = happyShift action_22
action_85 (23) = happyShift action_23
action_85 (24) = happyShift action_24
action_85 (26) = happyShift action_25
action_85 (28) = happyShift action_86
action_85 (29) = happyShift action_27
action_85 (31) = happyShift action_28
action_85 (52) = happyShift action_29
action_85 (53) = happyShift action_30
action_85 (54) = happyShift action_31
action_85 (55) = happyShift action_32
action_85 (56) = happyShift action_33
action_85 (57) = happyShift action_34
action_85 (58) = happyShift action_35
action_85 (59) = happyShift action_36
action_85 (8) = happyGoto action_15
action_85 (9) = happyGoto action_16
action_85 (10) = happyGoto action_17
action_85 (11) = happyGoto action_18
action_85 (14) = happyGoto action_19
action_85 _ = happyFail

action_86 _ = happyReduce_9

action_87 (7) = happyGoto action_93
action_87 _ = happyReduce_5

action_88 (7) = happyGoto action_92
action_88 _ = happyReduce_5

action_89 (30) = happyShift action_91
action_89 _ = happyFail

action_90 _ = happyReduce_28

action_91 (27) = happyShift action_96
action_91 _ = happyFail

action_92 (19) = happyShift action_20
action_92 (21) = happyShift action_21
action_92 (22) = happyShift action_22
action_92 (23) = happyShift action_23
action_92 (24) = happyShift action_24
action_92 (26) = happyShift action_25
action_92 (28) = happyShift action_95
action_92 (29) = happyShift action_27
action_92 (31) = happyShift action_28
action_92 (52) = happyShift action_29
action_92 (53) = happyShift action_30
action_92 (54) = happyShift action_31
action_92 (55) = happyShift action_32
action_92 (56) = happyShift action_33
action_92 (57) = happyShift action_34
action_92 (58) = happyShift action_35
action_92 (59) = happyShift action_36
action_92 (8) = happyGoto action_15
action_92 (9) = happyGoto action_16
action_92 (10) = happyGoto action_17
action_92 (11) = happyGoto action_18
action_92 (14) = happyGoto action_19
action_92 _ = happyFail

action_93 (19) = happyShift action_20
action_93 (21) = happyShift action_21
action_93 (22) = happyShift action_22
action_93 (23) = happyShift action_23
action_93 (24) = happyShift action_24
action_93 (26) = happyShift action_25
action_93 (28) = happyShift action_94
action_93 (29) = happyShift action_27
action_93 (31) = happyShift action_28
action_93 (52) = happyShift action_29
action_93 (53) = happyShift action_30
action_93 (54) = happyShift action_31
action_93 (55) = happyShift action_32
action_93 (56) = happyShift action_33
action_93 (57) = happyShift action_34
action_93 (58) = happyShift action_35
action_93 (59) = happyShift action_36
action_93 (8) = happyGoto action_15
action_93 (9) = happyGoto action_16
action_93 (10) = happyGoto action_17
action_93 (11) = happyGoto action_18
action_93 (14) = happyGoto action_19
action_93 _ = happyFail

action_94 _ = happyReduce_14

action_95 _ = happyReduce_10

action_96 (7) = happyGoto action_97
action_96 _ = happyReduce_5

action_97 (19) = happyShift action_20
action_97 (21) = happyShift action_21
action_97 (22) = happyShift action_22
action_97 (23) = happyShift action_23
action_97 (24) = happyShift action_24
action_97 (26) = happyShift action_25
action_97 (28) = happyShift action_98
action_97 (29) = happyShift action_27
action_97 (31) = happyShift action_28
action_97 (52) = happyShift action_29
action_97 (53) = happyShift action_30
action_97 (54) = happyShift action_31
action_97 (55) = happyShift action_32
action_97 (56) = happyShift action_33
action_97 (57) = happyShift action_34
action_97 (58) = happyShift action_35
action_97 (59) = happyShift action_36
action_97 (8) = happyGoto action_15
action_97 (9) = happyGoto action_16
action_97 (10) = happyGoto action_17
action_97 (11) = happyGoto action_18
action_97 (14) = happyGoto action_19
action_97 _ = happyFail

action_98 _ = happyReduce_13

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

happyReduce_4 = happyReduce 8 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Function happy_var_2 (reverse happy_var_7) (reverse happy_var_4)
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
happyReduction_18 (HappyAbsSyn14  happy_var_1)
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

happyReduce_21 = happyReduce 4 11 happyReduction_21
happyReduction_21 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (FunctionCall happy_var_1 (reverse happy_var_3)
	) `HappyStk` happyRest

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

happyReduce_24 = happySpecReduce_0  12 happyReduction_24
happyReduction_24  =  HappyAbsSyn12
		 ([]
	)

happyReduce_25 = happySpecReduce_3  12 happyReduction_25
happyReduction_25 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_3 : happy_var_1
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  12 happyReduction_26
happyReduction_26 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_0  13 happyReduction_27
happyReduction_27  =  HappyAbsSyn13
		 ([]
	)

happyReduce_28 = happySpecReduce_3  13 happyReduction_28
happyReduction_28 (HappyTerminal (TokenInteger happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_3 : happy_var_1
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  13 happyReduction_29
happyReduction_29 (HappyTerminal (TokenInteger happy_var_1))
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  14 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_3)
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  14 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn14
		 (Move
	)

happyReduce_32 = happySpecReduce_2  14 happyReduction_32
happyReduction_32 (HappyAbsSyn16  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Turn happy_var_2
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_2  14 happyReduction_33
happyReduction_33 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn14
		 (Mark happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  14 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn14
		 (Unmark happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn14
		 (PickUp
	)

happyReduce_36 = happySpecReduce_1  14 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn14
		 (Drop
	)

happyReduce_37 = happySpecReduce_2  14 happyReduction_37
happyReduction_37 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn14
		 (Flip happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  15 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn15
		 (Friend
	)

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn15
		 (Foe
	)

happyReduce_40 = happySpecReduce_1  15 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn15
		 (FriendWithFood
	)

happyReduce_41 = happySpecReduce_1  15 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn15
		 (FoeWithFood
	)

happyReduce_42 = happySpecReduce_1  15 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn15
		 (Food
	)

happyReduce_43 = happySpecReduce_1  15 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn15
		 (Rock
	)

happyReduce_44 = happySpecReduce_1  15 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn15
		 (Marker 0
	)

happyReduce_45 = happySpecReduce_1  15 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn15
		 (FoeMarker
	)

happyReduce_46 = happySpecReduce_1  15 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn15
		 (Home
	)

happyReduce_47 = happySpecReduce_1  15 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn15
		 (FoeHome
	)

happyReduce_48 = happySpecReduce_1  16 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn16
		 (IsLeft
	)

happyReduce_49 = happySpecReduce_1  16 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn16
		 (IsRight
	)

happyReduce_50 = happySpecReduce_1  17 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn17
		 (Here
	)

happyReduce_51 = happySpecReduce_1  17 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn17
		 (Ahead
	)

happyReduce_52 = happySpecReduce_1  17 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn17
		 (LeftAhead
	)

happyReduce_53 = happySpecReduce_1  17 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn17
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 60 60 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 18;
	TokenIf -> cont 19;
	TokenElse -> cont 20;
	TokenWhile -> cont 21;
	TokenBreak -> cont 22;
	TokenTrue -> cont 23;
	TokenTimes -> cont 24;
	TokenComma -> cont 25;
	TokenNot -> cont 26;
	TokenBraceLeft -> cont 27;
	TokenBraceRight -> cont 28;
	TokenParensLeft -> cont 29;
	TokenParensRight -> cont 30;
	TokenIdentifier happy_dollar_dollar -> cont 31;
	TokenInteger happy_dollar_dollar -> cont 32;
	TokenAnd -> cont 33;
	TokenOr -> cont 34;
	TokenComparison happy_dollar_dollar -> cont 35;
	TokenHere -> cont 36;
	TokenAhead -> cont 37;
	TokenLeftAhead -> cont 38;
	TokenRightAhead -> cont 39;
	TokenLeft -> cont 40;
	TokenRight -> cont 41;
	TokenFriend -> cont 42;
	TokenFoe -> cont 43;
	TokenFriendWithFood -> cont 44;
	TokenFoeWithFood -> cont 45;
	TokenFood -> cont 46;
	TokenRock -> cont 47;
	TokenMarker -> cont 48;
	TokenFoeMarker -> cont 49;
	TokenHome -> cont 50;
	TokenFoeHome -> cont 51;
	TokenSense -> cont 52;
	TokenMark -> cont 53;
	TokenUnmark -> cont 54;
	TokenPickUp -> cont 55;
	TokenDrop -> cont 56;
	TokenTurn -> cont 57;
	TokenMove -> cont 58;
	TokenFlip -> cont 59;
	_ -> happyError' (tk:tks)
	}

happyError_ 60 tk tks = happyError' tks
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
