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

action_3 (57) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (31) = happyShift action_6
action_5 _ = happyFail

action_6 (29) = happyShift action_7
action_6 _ = happyFail

action_7 (31) = happyShift action_9
action_7 (13) = happyGoto action_8
action_7 _ = happyReduce_25

action_8 (25) = happyShift action_10
action_8 (30) = happyShift action_11
action_8 _ = happyFail

action_9 _ = happyReduce_27

action_10 (31) = happyShift action_13
action_10 _ = happyFail

action_11 (27) = happyShift action_12
action_11 _ = happyFail

action_12 (7) = happyGoto action_14
action_12 _ = happyReduce_5

action_13 _ = happyReduce_26

action_14 (19) = happyShift action_21
action_14 (21) = happyShift action_22
action_14 (22) = happyShift action_23
action_14 (23) = happyShift action_24
action_14 (24) = happyShift action_25
action_14 (26) = happyShift action_26
action_14 (28) = happyShift action_27
action_14 (29) = happyShift action_28
action_14 (31) = happyShift action_29
action_14 (48) = happyShift action_30
action_14 (49) = happyShift action_31
action_14 (50) = happyShift action_32
action_14 (51) = happyShift action_33
action_14 (52) = happyShift action_34
action_14 (53) = happyShift action_35
action_14 (54) = happyShift action_36
action_14 (55) = happyShift action_37
action_14 (56) = happyShift action_38
action_14 (8) = happyGoto action_15
action_14 (9) = happyGoto action_16
action_14 (10) = happyGoto action_17
action_14 (11) = happyGoto action_18
action_14 (12) = happyGoto action_19
action_14 (16) = happyGoto action_20
action_14 _ = happyFail

action_15 _ = happyReduce_6

action_16 _ = happyReduce_7

action_17 (20) = happyShift action_53
action_17 _ = happyReduce_12

action_18 _ = happyReduce_10

action_19 (33) = happyShift action_51
action_19 (34) = happyShift action_52
action_19 _ = happyReduce_18

action_20 _ = happyReduce_19

action_21 (29) = happyShift action_50
action_21 _ = happyFail

action_22 (29) = happyShift action_49
action_22 _ = happyFail

action_23 _ = happyReduce_9

action_24 _ = happyReduce_21

action_25 (29) = happyShift action_48
action_25 _ = happyFail

action_26 (23) = happyShift action_24
action_26 (26) = happyShift action_26
action_26 (29) = happyShift action_28
action_26 (31) = happyShift action_29
action_26 (48) = happyShift action_30
action_26 (49) = happyShift action_31
action_26 (50) = happyShift action_32
action_26 (51) = happyShift action_33
action_26 (52) = happyShift action_34
action_26 (53) = happyShift action_35
action_26 (54) = happyShift action_36
action_26 (55) = happyShift action_37
action_26 (56) = happyShift action_38
action_26 (12) = happyGoto action_47
action_26 (16) = happyGoto action_20
action_26 _ = happyFail

action_27 _ = happyReduce_4

action_28 (23) = happyShift action_24
action_28 (26) = happyShift action_26
action_28 (29) = happyShift action_28
action_28 (31) = happyShift action_29
action_28 (48) = happyShift action_30
action_28 (49) = happyShift action_31
action_28 (50) = happyShift action_32
action_28 (51) = happyShift action_33
action_28 (52) = happyShift action_34
action_28 (53) = happyShift action_35
action_28 (54) = happyShift action_36
action_28 (55) = happyShift action_37
action_28 (56) = happyShift action_38
action_28 (11) = happyGoto action_46
action_28 (12) = happyGoto action_19
action_28 (16) = happyGoto action_20
action_28 _ = happyFail

action_29 (29) = happyShift action_44
action_29 (35) = happyShift action_45
action_29 _ = happyFail

action_30 (36) = happyShift action_43
action_30 _ = happyFail

action_31 (32) = happyShift action_42
action_31 _ = happyFail

action_32 (32) = happyShift action_41
action_32 _ = happyFail

action_33 _ = happyReduce_38

action_34 _ = happyReduce_39

action_35 (37) = happyShift action_40
action_35 _ = happyFail

action_36 _ = happyReduce_34

action_37 (32) = happyShift action_39
action_37 _ = happyFail

action_38 _ = happyReduce_41

action_39 _ = happyReduce_40

action_40 _ = happyReduce_35

action_41 _ = happyReduce_37

action_42 _ = happyReduce_36

action_43 (38) = happyShift action_68
action_43 (39) = happyShift action_69
action_43 (40) = happyShift action_70
action_43 (41) = happyShift action_71
action_43 (42) = happyShift action_72
action_43 (43) = happyShift action_73
action_43 (44) = happyShift action_74
action_43 (45) = happyShift action_75
action_43 (46) = happyShift action_76
action_43 (47) = happyShift action_77
action_43 (17) = happyGoto action_67
action_43 _ = happyFail

action_44 (31) = happyShift action_65
action_44 (32) = happyShift action_66
action_44 (14) = happyGoto action_63
action_44 (15) = happyGoto action_64
action_44 _ = happyReduce_28

action_45 (32) = happyShift action_62
action_45 _ = happyFail

action_46 (30) = happyShift action_61
action_46 _ = happyFail

action_47 _ = happyReduce_20

action_48 (31) = happyShift action_60
action_48 _ = happyFail

action_49 (23) = happyShift action_24
action_49 (26) = happyShift action_26
action_49 (29) = happyShift action_28
action_49 (31) = happyShift action_29
action_49 (48) = happyShift action_30
action_49 (49) = happyShift action_31
action_49 (50) = happyShift action_32
action_49 (51) = happyShift action_33
action_49 (52) = happyShift action_34
action_49 (53) = happyShift action_35
action_49 (54) = happyShift action_36
action_49 (55) = happyShift action_37
action_49 (56) = happyShift action_38
action_49 (11) = happyGoto action_59
action_49 (12) = happyGoto action_19
action_49 (16) = happyGoto action_20
action_49 _ = happyFail

action_50 (23) = happyShift action_24
action_50 (26) = happyShift action_26
action_50 (29) = happyShift action_28
action_50 (31) = happyShift action_29
action_50 (48) = happyShift action_30
action_50 (49) = happyShift action_31
action_50 (50) = happyShift action_32
action_50 (51) = happyShift action_33
action_50 (52) = happyShift action_34
action_50 (53) = happyShift action_35
action_50 (54) = happyShift action_36
action_50 (55) = happyShift action_37
action_50 (56) = happyShift action_38
action_50 (11) = happyGoto action_58
action_50 (12) = happyGoto action_19
action_50 (16) = happyGoto action_20
action_50 _ = happyFail

action_51 (23) = happyShift action_24
action_51 (26) = happyShift action_26
action_51 (29) = happyShift action_28
action_51 (31) = happyShift action_29
action_51 (48) = happyShift action_30
action_51 (49) = happyShift action_31
action_51 (50) = happyShift action_32
action_51 (51) = happyShift action_33
action_51 (52) = happyShift action_34
action_51 (53) = happyShift action_35
action_51 (54) = happyShift action_36
action_51 (55) = happyShift action_37
action_51 (56) = happyShift action_38
action_51 (11) = happyGoto action_57
action_51 (12) = happyGoto action_19
action_51 (16) = happyGoto action_20
action_51 _ = happyFail

action_52 (23) = happyShift action_24
action_52 (26) = happyShift action_26
action_52 (29) = happyShift action_28
action_52 (31) = happyShift action_29
action_52 (48) = happyShift action_30
action_52 (49) = happyShift action_31
action_52 (50) = happyShift action_32
action_52 (51) = happyShift action_33
action_52 (52) = happyShift action_34
action_52 (53) = happyShift action_35
action_52 (54) = happyShift action_36
action_52 (55) = happyShift action_37
action_52 (56) = happyShift action_38
action_52 (11) = happyGoto action_56
action_52 (12) = happyGoto action_19
action_52 (16) = happyGoto action_20
action_52 _ = happyFail

action_53 (19) = happyShift action_21
action_53 (27) = happyShift action_55
action_53 (9) = happyGoto action_54
action_53 (10) = happyGoto action_17
action_53 _ = happyFail

action_54 _ = happyReduce_13

action_55 (7) = happyGoto action_84
action_55 _ = happyReduce_5

action_56 _ = happyReduce_17

action_57 _ = happyReduce_16

action_58 (30) = happyShift action_83
action_58 _ = happyFail

action_59 (30) = happyShift action_82
action_59 _ = happyFail

action_60 (25) = happyShift action_81
action_60 _ = happyFail

action_61 _ = happyReduce_23

action_62 _ = happyReduce_24

action_63 (25) = happyShift action_79
action_63 (30) = happyShift action_80
action_63 _ = happyFail

action_64 _ = happyReduce_30

action_65 _ = happyReduce_32

action_66 _ = happyReduce_31

action_67 _ = happyReduce_33

action_68 _ = happyReduce_42

action_69 _ = happyReduce_43

action_70 _ = happyReduce_44

action_71 _ = happyReduce_45

action_72 _ = happyReduce_46

action_73 _ = happyReduce_47

action_74 (29) = happyShift action_78
action_74 _ = happyFail

action_75 _ = happyReduce_50

action_76 _ = happyReduce_51

action_77 _ = happyReduce_52

action_78 (31) = happyShift action_90
action_78 (32) = happyShift action_91
action_78 _ = happyFail

action_79 (31) = happyShift action_65
action_79 (32) = happyShift action_66
action_79 (15) = happyGoto action_89
action_79 _ = happyFail

action_80 _ = happyReduce_22

action_81 (31) = happyShift action_65
action_81 (32) = happyShift action_66
action_81 (15) = happyGoto action_88
action_81 _ = happyFail

action_82 (27) = happyShift action_87
action_82 _ = happyFail

action_83 (27) = happyShift action_86
action_83 _ = happyFail

action_84 (19) = happyShift action_21
action_84 (21) = happyShift action_22
action_84 (22) = happyShift action_23
action_84 (23) = happyShift action_24
action_84 (24) = happyShift action_25
action_84 (26) = happyShift action_26
action_84 (28) = happyShift action_85
action_84 (29) = happyShift action_28
action_84 (31) = happyShift action_29
action_84 (48) = happyShift action_30
action_84 (49) = happyShift action_31
action_84 (50) = happyShift action_32
action_84 (51) = happyShift action_33
action_84 (52) = happyShift action_34
action_84 (53) = happyShift action_35
action_84 (54) = happyShift action_36
action_84 (55) = happyShift action_37
action_84 (56) = happyShift action_38
action_84 (8) = happyGoto action_15
action_84 (9) = happyGoto action_16
action_84 (10) = happyGoto action_17
action_84 (11) = happyGoto action_18
action_84 (12) = happyGoto action_19
action_84 (16) = happyGoto action_20
action_84 _ = happyFail

action_85 _ = happyReduce_14

action_86 (7) = happyGoto action_96
action_86 _ = happyReduce_5

action_87 (7) = happyGoto action_95
action_87 _ = happyReduce_5

action_88 (30) = happyShift action_94
action_88 _ = happyFail

action_89 _ = happyReduce_29

action_90 (30) = happyShift action_93
action_90 _ = happyFail

action_91 (30) = happyShift action_92
action_91 _ = happyFail

action_92 _ = happyReduce_48

action_93 _ = happyReduce_49

action_94 (27) = happyShift action_99
action_94 _ = happyFail

action_95 (19) = happyShift action_21
action_95 (21) = happyShift action_22
action_95 (22) = happyShift action_23
action_95 (23) = happyShift action_24
action_95 (24) = happyShift action_25
action_95 (26) = happyShift action_26
action_95 (28) = happyShift action_98
action_95 (29) = happyShift action_28
action_95 (31) = happyShift action_29
action_95 (48) = happyShift action_30
action_95 (49) = happyShift action_31
action_95 (50) = happyShift action_32
action_95 (51) = happyShift action_33
action_95 (52) = happyShift action_34
action_95 (53) = happyShift action_35
action_95 (54) = happyShift action_36
action_95 (55) = happyShift action_37
action_95 (56) = happyShift action_38
action_95 (8) = happyGoto action_15
action_95 (9) = happyGoto action_16
action_95 (10) = happyGoto action_17
action_95 (11) = happyGoto action_18
action_95 (12) = happyGoto action_19
action_95 (16) = happyGoto action_20
action_95 _ = happyFail

action_96 (19) = happyShift action_21
action_96 (21) = happyShift action_22
action_96 (22) = happyShift action_23
action_96 (23) = happyShift action_24
action_96 (24) = happyShift action_25
action_96 (26) = happyShift action_26
action_96 (28) = happyShift action_97
action_96 (29) = happyShift action_28
action_96 (31) = happyShift action_29
action_96 (48) = happyShift action_30
action_96 (49) = happyShift action_31
action_96 (50) = happyShift action_32
action_96 (51) = happyShift action_33
action_96 (52) = happyShift action_34
action_96 (53) = happyShift action_35
action_96 (54) = happyShift action_36
action_96 (55) = happyShift action_37
action_96 (56) = happyShift action_38
action_96 (8) = happyGoto action_15
action_96 (9) = happyGoto action_16
action_96 (10) = happyGoto action_17
action_96 (11) = happyGoto action_18
action_96 (12) = happyGoto action_19
action_96 (16) = happyGoto action_20
action_96 _ = happyFail

action_97 _ = happyReduce_15

action_98 _ = happyReduce_8

action_99 (7) = happyGoto action_100
action_99 _ = happyReduce_5

action_100 (19) = happyShift action_21
action_100 (21) = happyShift action_22
action_100 (22) = happyShift action_23
action_100 (23) = happyShift action_24
action_100 (24) = happyShift action_25
action_100 (26) = happyShift action_26
action_100 (28) = happyShift action_101
action_100 (29) = happyShift action_28
action_100 (31) = happyShift action_29
action_100 (48) = happyShift action_30
action_100 (49) = happyShift action_31
action_100 (50) = happyShift action_32
action_100 (51) = happyShift action_33
action_100 (52) = happyShift action_34
action_100 (53) = happyShift action_35
action_100 (54) = happyShift action_36
action_100 (55) = happyShift action_37
action_100 (56) = happyShift action_38
action_100 (8) = happyGoto action_15
action_100 (9) = happyGoto action_16
action_100 (10) = happyGoto action_17
action_100 (11) = happyGoto action_18
action_100 (12) = happyGoto action_19
action_100 (16) = happyGoto action_20
action_100 _ = happyFail

action_101 _ = happyReduce_11

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
	(HappyAbsSyn13  happy_var_4) `HappyStk`
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
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 7 8 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (While happy_var_3 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_1  8 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn8
		 (Break
	)

happyReduce_10 = happySpecReduce_1  8 happyReduction_10
happyReduction_10 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (Expr happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 9 8 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn15  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Times happy_var_3 happy_var_5 happy_var_8
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  9 happyReduction_12
happyReduction_12 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 []
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  9 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1 ([happy_var_3])
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 5 9 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (happy_var_1 (reverse happy_var_4)
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 7 10 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (If happy_var_3 (reverse happy_var_6)
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  11 happyReduction_16
happyReduction_16 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (And happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11 happyReduction_17
happyReduction_17 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (Or happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  11 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  12 happyReduction_19
happyReduction_19 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn12
		 (ExpressionCommand happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (Not happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  12 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn12
		 (BoolExpression True
	)

happyReduce_22 = happyReduce 4 12 happyReduction_22
happyReduction_22 (_ `HappyStk`
	(HappyAbsSyn14  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn12
		 (FunctionCall happy_var_1 (reverse happy_var_3)
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyTerminal (TokenInteger happy_var_3))
	(HappyTerminal (TokenComparison happy_var_2))
	(HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn12
		 (Comparison happy_var_2 happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_0  13 happyReduction_25
happyReduction_25  =  HappyAbsSyn13
		 ([]
	)

happyReduce_26 = happySpecReduce_3  13 happyReduction_26
happyReduction_26 (HappyTerminal (TokenIdentifier happy_var_3))
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_3 : happy_var_1
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn13
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_0  14 happyReduction_28
happyReduction_28  =  HappyAbsSyn14
		 ([]
	)

happyReduce_29 = happySpecReduce_3  14 happyReduction_29
happyReduction_29 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3 : happy_var_1
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  15 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInteger happy_var_1))
	 =  HappyAbsSyn15
		 (Value happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 (HappyTerminal (TokenIdentifier happy_var_1))
	 =  HappyAbsSyn15
		 (Var happy_var_1
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_3  16 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_3)
	(HappyTerminal (TokenSenseDirection happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_33 _ _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (Move
	)

happyReduce_35 = happySpecReduce_2  16 happyReduction_35
happyReduction_35 (HappyTerminal (TokenDirection happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Turn happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_2  16 happyReduction_36
happyReduction_36 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Mark happy_var_2
	)
happyReduction_36 _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_2  16 happyReduction_37
happyReduction_37 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Unmark happy_var_2
	)
happyReduction_37 _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  16 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn16
		 (PickUp
	)

happyReduce_39 = happySpecReduce_1  16 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn16
		 (Drop
	)

happyReduce_40 = happySpecReduce_2  16 happyReduction_40
happyReduction_40 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Flip happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn16
		 (Nop
	)

happyReduce_42 = happySpecReduce_1  17 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn17
		 (Friend
	)

happyReduce_43 = happySpecReduce_1  17 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn17
		 (Foe
	)

happyReduce_44 = happySpecReduce_1  17 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn17
		 (FriendWithFood
	)

happyReduce_45 = happySpecReduce_1  17 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn17
		 (FoeWithFood
	)

happyReduce_46 = happySpecReduce_1  17 happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn17
		 (Food
	)

happyReduce_47 = happySpecReduce_1  17 happyReduction_47
happyReduction_47 _
	 =  HappyAbsSyn17
		 (Rock
	)

happyReduce_48 = happyReduce 4 17 happyReduction_48
happyReduction_48 (_ `HappyStk`
	(HappyTerminal (TokenInteger happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (Marker happy_var_3
	) `HappyStk` happyRest

happyReduce_49 = happyReduce 4 17 happyReduction_49
happyReduction_49 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (MarkerVar happy_var_3
	) `HappyStk` happyRest

happyReduce_50 = happySpecReduce_1  17 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn17
		 (FoeMarker
	)

happyReduce_51 = happySpecReduce_1  17 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn17
		 (Home
	)

happyReduce_52 = happySpecReduce_1  17 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn17
		 (FoeHome
	)

happyNewToken action sts stk [] =
	action 57 57 notHappyAtAll (HappyState action) sts stk []

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
	TokenSenseDirection happy_dollar_dollar -> cont 36;
	TokenDirection happy_dollar_dollar -> cont 37;
	TokenFriend -> cont 38;
	TokenFoe -> cont 39;
	TokenFriendWithFood -> cont 40;
	TokenFoeWithFood -> cont 41;
	TokenFood -> cont 42;
	TokenRock -> cont 43;
	TokenMarker -> cont 44;
	TokenFoeMarker -> cont 45;
	TokenHome -> cont 46;
	TokenFoeHome -> cont 47;
	TokenSense -> cont 48;
	TokenMark -> cont 49;
	TokenUnmark -> cont 50;
	TokenPickUp -> cont 51;
	TokenDrop -> cont 52;
	TokenTurn -> cont 53;
	TokenMove -> cont 54;
	TokenFlip -> cont 55;
	TokenNop -> cont 56;
	_ -> happyError' (tk:tks)
	}

happyError_ 57 tk tks = happyError' tks
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
