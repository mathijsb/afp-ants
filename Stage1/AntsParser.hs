{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
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
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (20) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (63) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (33) = happyShift action_6
action_5 _ = happyFail

action_6 (31) = happyShift action_7
action_6 _ = happyFail

action_7 (33) = happyShift action_9
action_7 (13) = happyGoto action_8
action_7 _ = happyReduce_25

action_8 (27) = happyShift action_10
action_8 (32) = happyShift action_11
action_8 _ = happyFail

action_9 _ = happyReduce_27

action_10 (33) = happyShift action_13
action_10 _ = happyFail

action_11 (29) = happyShift action_12
action_11 _ = happyFail

action_12 (7) = happyGoto action_14
action_12 _ = happyReduce_5

action_13 _ = happyReduce_26

action_14 (21) = happyShift action_21
action_14 (23) = happyShift action_22
action_14 (24) = happyShift action_23
action_14 (25) = happyShift action_24
action_14 (26) = happyShift action_25
action_14 (28) = happyShift action_26
action_14 (30) = happyShift action_27
action_14 (31) = happyShift action_28
action_14 (33) = happyShift action_29
action_14 (54) = happyShift action_30
action_14 (55) = happyShift action_31
action_14 (56) = happyShift action_32
action_14 (57) = happyShift action_33
action_14 (58) = happyShift action_34
action_14 (59) = happyShift action_35
action_14 (60) = happyShift action_36
action_14 (61) = happyShift action_37
action_14 (62) = happyShift action_38
action_14 (8) = happyGoto action_15
action_14 (9) = happyGoto action_16
action_14 (10) = happyGoto action_17
action_14 (11) = happyGoto action_18
action_14 (12) = happyGoto action_19
action_14 (16) = happyGoto action_20
action_14 _ = happyFail

action_15 _ = happyReduce_6

action_16 _ = happyReduce_7

action_17 (22) = happyShift action_59
action_17 _ = happyReduce_12

action_18 _ = happyReduce_10

action_19 (35) = happyShift action_57
action_19 (36) = happyShift action_58
action_19 _ = happyReduce_18

action_20 _ = happyReduce_19

action_21 (31) = happyShift action_56
action_21 _ = happyFail

action_22 (31) = happyShift action_55
action_22 _ = happyFail

action_23 _ = happyReduce_9

action_24 _ = happyReduce_21

action_25 (31) = happyShift action_54
action_25 _ = happyFail

action_26 (25) = happyShift action_24
action_26 (28) = happyShift action_26
action_26 (31) = happyShift action_28
action_26 (33) = happyShift action_29
action_26 (54) = happyShift action_30
action_26 (55) = happyShift action_31
action_26 (56) = happyShift action_32
action_26 (57) = happyShift action_33
action_26 (58) = happyShift action_34
action_26 (59) = happyShift action_35
action_26 (60) = happyShift action_36
action_26 (61) = happyShift action_37
action_26 (62) = happyShift action_38
action_26 (12) = happyGoto action_53
action_26 (16) = happyGoto action_20
action_26 _ = happyFail

action_27 _ = happyReduce_4

action_28 (25) = happyShift action_24
action_28 (28) = happyShift action_26
action_28 (31) = happyShift action_28
action_28 (33) = happyShift action_29
action_28 (54) = happyShift action_30
action_28 (55) = happyShift action_31
action_28 (56) = happyShift action_32
action_28 (57) = happyShift action_33
action_28 (58) = happyShift action_34
action_28 (59) = happyShift action_35
action_28 (60) = happyShift action_36
action_28 (61) = happyShift action_37
action_28 (62) = happyShift action_38
action_28 (11) = happyGoto action_52
action_28 (12) = happyGoto action_19
action_28 (16) = happyGoto action_20
action_28 _ = happyFail

action_29 (31) = happyShift action_50
action_29 (37) = happyShift action_51
action_29 _ = happyFail

action_30 (38) = happyShift action_46
action_30 (39) = happyShift action_47
action_30 (40) = happyShift action_48
action_30 (41) = happyShift action_49
action_30 (19) = happyGoto action_45
action_30 _ = happyFail

action_31 (34) = happyShift action_44
action_31 _ = happyFail

action_32 (34) = happyShift action_43
action_32 _ = happyFail

action_33 _ = happyReduce_38

action_34 _ = happyReduce_39

action_35 (42) = happyShift action_41
action_35 (43) = happyShift action_42
action_35 (18) = happyGoto action_40
action_35 _ = happyFail

action_36 _ = happyReduce_34

action_37 (34) = happyShift action_39
action_37 _ = happyFail

action_38 _ = happyReduce_41

action_39 _ = happyReduce_40

action_40 _ = happyReduce_35

action_41 _ = happyReduce_53

action_42 _ = happyReduce_54

action_43 _ = happyReduce_37

action_44 _ = happyReduce_36

action_45 (44) = happyShift action_74
action_45 (45) = happyShift action_75
action_45 (46) = happyShift action_76
action_45 (47) = happyShift action_77
action_45 (48) = happyShift action_78
action_45 (49) = happyShift action_79
action_45 (50) = happyShift action_80
action_45 (51) = happyShift action_81
action_45 (52) = happyShift action_82
action_45 (53) = happyShift action_83
action_45 (17) = happyGoto action_73
action_45 _ = happyFail

action_46 _ = happyReduce_55

action_47 _ = happyReduce_56

action_48 _ = happyReduce_57

action_49 _ = happyReduce_58

action_50 (33) = happyShift action_71
action_50 (34) = happyShift action_72
action_50 (14) = happyGoto action_69
action_50 (15) = happyGoto action_70
action_50 _ = happyReduce_28

action_51 (34) = happyShift action_68
action_51 _ = happyFail

action_52 (32) = happyShift action_67
action_52 _ = happyFail

action_53 _ = happyReduce_20

action_54 (33) = happyShift action_66
action_54 _ = happyFail

action_55 (25) = happyShift action_24
action_55 (28) = happyShift action_26
action_55 (31) = happyShift action_28
action_55 (33) = happyShift action_29
action_55 (54) = happyShift action_30
action_55 (55) = happyShift action_31
action_55 (56) = happyShift action_32
action_55 (57) = happyShift action_33
action_55 (58) = happyShift action_34
action_55 (59) = happyShift action_35
action_55 (60) = happyShift action_36
action_55 (61) = happyShift action_37
action_55 (62) = happyShift action_38
action_55 (11) = happyGoto action_65
action_55 (12) = happyGoto action_19
action_55 (16) = happyGoto action_20
action_55 _ = happyFail

action_56 (25) = happyShift action_24
action_56 (28) = happyShift action_26
action_56 (31) = happyShift action_28
action_56 (33) = happyShift action_29
action_56 (54) = happyShift action_30
action_56 (55) = happyShift action_31
action_56 (56) = happyShift action_32
action_56 (57) = happyShift action_33
action_56 (58) = happyShift action_34
action_56 (59) = happyShift action_35
action_56 (60) = happyShift action_36
action_56 (61) = happyShift action_37
action_56 (62) = happyShift action_38
action_56 (11) = happyGoto action_64
action_56 (12) = happyGoto action_19
action_56 (16) = happyGoto action_20
action_56 _ = happyFail

action_57 (25) = happyShift action_24
action_57 (28) = happyShift action_26
action_57 (31) = happyShift action_28
action_57 (33) = happyShift action_29
action_57 (54) = happyShift action_30
action_57 (55) = happyShift action_31
action_57 (56) = happyShift action_32
action_57 (57) = happyShift action_33
action_57 (58) = happyShift action_34
action_57 (59) = happyShift action_35
action_57 (60) = happyShift action_36
action_57 (61) = happyShift action_37
action_57 (62) = happyShift action_38
action_57 (11) = happyGoto action_63
action_57 (12) = happyGoto action_19
action_57 (16) = happyGoto action_20
action_57 _ = happyFail

action_58 (25) = happyShift action_24
action_58 (28) = happyShift action_26
action_58 (31) = happyShift action_28
action_58 (33) = happyShift action_29
action_58 (54) = happyShift action_30
action_58 (55) = happyShift action_31
action_58 (56) = happyShift action_32
action_58 (57) = happyShift action_33
action_58 (58) = happyShift action_34
action_58 (59) = happyShift action_35
action_58 (60) = happyShift action_36
action_58 (61) = happyShift action_37
action_58 (62) = happyShift action_38
action_58 (11) = happyGoto action_62
action_58 (12) = happyGoto action_19
action_58 (16) = happyGoto action_20
action_58 _ = happyFail

action_59 (21) = happyShift action_21
action_59 (29) = happyShift action_61
action_59 (9) = happyGoto action_60
action_59 (10) = happyGoto action_17
action_59 _ = happyFail

action_60 _ = happyReduce_13

action_61 (7) = happyGoto action_90
action_61 _ = happyReduce_5

action_62 _ = happyReduce_17

action_63 _ = happyReduce_16

action_64 (32) = happyShift action_89
action_64 _ = happyFail

action_65 (32) = happyShift action_88
action_65 _ = happyFail

action_66 (27) = happyShift action_87
action_66 _ = happyFail

action_67 _ = happyReduce_23

action_68 _ = happyReduce_24

action_69 (27) = happyShift action_85
action_69 (32) = happyShift action_86
action_69 _ = happyFail

action_70 _ = happyReduce_30

action_71 _ = happyReduce_32

action_72 _ = happyReduce_31

action_73 _ = happyReduce_33

action_74 _ = happyReduce_42

action_75 _ = happyReduce_43

action_76 _ = happyReduce_44

action_77 _ = happyReduce_45

action_78 _ = happyReduce_46

action_79 _ = happyReduce_47

action_80 (31) = happyShift action_84
action_80 _ = happyFail

action_81 _ = happyReduce_50

action_82 _ = happyReduce_51

action_83 _ = happyReduce_52

action_84 (33) = happyShift action_96
action_84 (34) = happyShift action_97
action_84 _ = happyFail

action_85 (33) = happyShift action_71
action_85 (34) = happyShift action_72
action_85 (15) = happyGoto action_95
action_85 _ = happyFail

action_86 _ = happyReduce_22

action_87 (34) = happyShift action_94
action_87 _ = happyFail

action_88 (29) = happyShift action_93
action_88 _ = happyFail

action_89 (29) = happyShift action_92
action_89 _ = happyFail

action_90 (21) = happyShift action_21
action_90 (23) = happyShift action_22
action_90 (24) = happyShift action_23
action_90 (25) = happyShift action_24
action_90 (26) = happyShift action_25
action_90 (28) = happyShift action_26
action_90 (30) = happyShift action_91
action_90 (31) = happyShift action_28
action_90 (33) = happyShift action_29
action_90 (54) = happyShift action_30
action_90 (55) = happyShift action_31
action_90 (56) = happyShift action_32
action_90 (57) = happyShift action_33
action_90 (58) = happyShift action_34
action_90 (59) = happyShift action_35
action_90 (60) = happyShift action_36
action_90 (61) = happyShift action_37
action_90 (62) = happyShift action_38
action_90 (8) = happyGoto action_15
action_90 (9) = happyGoto action_16
action_90 (10) = happyGoto action_17
action_90 (11) = happyGoto action_18
action_90 (12) = happyGoto action_19
action_90 (16) = happyGoto action_20
action_90 _ = happyFail

action_91 _ = happyReduce_14

action_92 (7) = happyGoto action_102
action_92 _ = happyReduce_5

action_93 (7) = happyGoto action_101
action_93 _ = happyReduce_5

action_94 (32) = happyShift action_100
action_94 _ = happyFail

action_95 _ = happyReduce_29

action_96 (32) = happyShift action_99
action_96 _ = happyFail

action_97 (32) = happyShift action_98
action_97 _ = happyFail

action_98 _ = happyReduce_48

action_99 _ = happyReduce_49

action_100 (29) = happyShift action_105
action_100 _ = happyFail

action_101 (21) = happyShift action_21
action_101 (23) = happyShift action_22
action_101 (24) = happyShift action_23
action_101 (25) = happyShift action_24
action_101 (26) = happyShift action_25
action_101 (28) = happyShift action_26
action_101 (30) = happyShift action_104
action_101 (31) = happyShift action_28
action_101 (33) = happyShift action_29
action_101 (54) = happyShift action_30
action_101 (55) = happyShift action_31
action_101 (56) = happyShift action_32
action_101 (57) = happyShift action_33
action_101 (58) = happyShift action_34
action_101 (59) = happyShift action_35
action_101 (60) = happyShift action_36
action_101 (61) = happyShift action_37
action_101 (62) = happyShift action_38
action_101 (8) = happyGoto action_15
action_101 (9) = happyGoto action_16
action_101 (10) = happyGoto action_17
action_101 (11) = happyGoto action_18
action_101 (12) = happyGoto action_19
action_101 (16) = happyGoto action_20
action_101 _ = happyFail

action_102 (21) = happyShift action_21
action_102 (23) = happyShift action_22
action_102 (24) = happyShift action_23
action_102 (25) = happyShift action_24
action_102 (26) = happyShift action_25
action_102 (28) = happyShift action_26
action_102 (30) = happyShift action_103
action_102 (31) = happyShift action_28
action_102 (33) = happyShift action_29
action_102 (54) = happyShift action_30
action_102 (55) = happyShift action_31
action_102 (56) = happyShift action_32
action_102 (57) = happyShift action_33
action_102 (58) = happyShift action_34
action_102 (59) = happyShift action_35
action_102 (60) = happyShift action_36
action_102 (61) = happyShift action_37
action_102 (62) = happyShift action_38
action_102 (8) = happyGoto action_15
action_102 (9) = happyGoto action_16
action_102 (10) = happyGoto action_17
action_102 (11) = happyGoto action_18
action_102 (12) = happyGoto action_19
action_102 (16) = happyGoto action_20
action_102 _ = happyFail

action_103 _ = happyReduce_15

action_104 _ = happyReduce_8

action_105 (7) = happyGoto action_106
action_105 _ = happyReduce_5

action_106 (21) = happyShift action_21
action_106 (23) = happyShift action_22
action_106 (24) = happyShift action_23
action_106 (25) = happyShift action_24
action_106 (26) = happyShift action_25
action_106 (28) = happyShift action_26
action_106 (30) = happyShift action_107
action_106 (31) = happyShift action_28
action_106 (33) = happyShift action_29
action_106 (54) = happyShift action_30
action_106 (55) = happyShift action_31
action_106 (56) = happyShift action_32
action_106 (57) = happyShift action_33
action_106 (58) = happyShift action_34
action_106 (59) = happyShift action_35
action_106 (60) = happyShift action_36
action_106 (61) = happyShift action_37
action_106 (62) = happyShift action_38
action_106 (8) = happyGoto action_15
action_106 (9) = happyGoto action_16
action_106 (10) = happyGoto action_17
action_106 (11) = happyGoto action_18
action_106 (12) = happyGoto action_19
action_106 (16) = happyGoto action_20
action_106 _ = happyFail

action_107 _ = happyReduce_11

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
	(HappyTerminal (TokenInteger happy_var_5)) `HappyStk`
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
	(HappyAbsSyn19  happy_var_2)
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
happyReduction_35 (HappyAbsSyn18  happy_var_2)
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

happyReduce_53 = happySpecReduce_1  18 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn18
		 (IsLeft
	)

happyReduce_54 = happySpecReduce_1  18 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn18
		 (IsRight
	)

happyReduce_55 = happySpecReduce_1  19 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn19
		 (Here
	)

happyReduce_56 = happySpecReduce_1  19 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn19
		 (Ahead
	)

happyReduce_57 = happySpecReduce_1  19 happyReduction_57
happyReduction_57 _
	 =  HappyAbsSyn19
		 (LeftAhead
	)

happyReduce_58 = happySpecReduce_1  19 happyReduction_58
happyReduction_58 _
	 =  HappyAbsSyn19
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 63 63 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 20;
	TokenIf -> cont 21;
	TokenElse -> cont 22;
	TokenWhile -> cont 23;
	TokenBreak -> cont 24;
	TokenTrue -> cont 25;
	TokenTimes -> cont 26;
	TokenComma -> cont 27;
	TokenNot -> cont 28;
	TokenBraceLeft -> cont 29;
	TokenBraceRight -> cont 30;
	TokenParensLeft -> cont 31;
	TokenParensRight -> cont 32;
	TokenIdentifier happy_dollar_dollar -> cont 33;
	TokenInteger happy_dollar_dollar -> cont 34;
	TokenAnd -> cont 35;
	TokenOr -> cont 36;
	TokenComparison happy_dollar_dollar -> cont 37;
	TokenHere -> cont 38;
	TokenAhead -> cont 39;
	TokenLeftAhead -> cont 40;
	TokenRightAhead -> cont 41;
	TokenLeft -> cont 42;
	TokenRight -> cont 43;
	TokenFriend -> cont 44;
	TokenFoe -> cont 45;
	TokenFriendWithFood -> cont 46;
	TokenFoeWithFood -> cont 47;
	TokenFood -> cont 48;
	TokenRock -> cont 49;
	TokenMarker -> cont 50;
	TokenFoeMarker -> cont 51;
	TokenHome -> cont 52;
	TokenFoeHome -> cont 53;
	TokenSense -> cont 54;
	TokenMark -> cont 55;
	TokenUnmark -> cont 56;
	TokenPickUp -> cont 57;
	TokenDrop -> cont 58;
	TokenTurn -> cont 59;
	TokenMove -> cont 60;
	TokenFlip -> cont 61;
	TokenNop -> cont 62;
	_ -> happyError' (tk:tks)
	}

happyError_ 63 tk tks = happyError' tks
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
