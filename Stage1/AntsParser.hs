{-# OPTIONS_GHC -w #-}
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

-- parser produced by Happy Version 1.18.10

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
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

action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_2
action_0 _ = happyReduce_2

action_1 (5) = happyGoto action_2
action_1 _ = happyFail

action_2 (19) = happyShift action_5
action_2 (6) = happyGoto action_4
action_2 _ = happyReduce_1

action_3 (62) = happyAccept
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 (32) = happyShift action_6
action_5 _ = happyFail

action_6 (30) = happyShift action_7
action_6 _ = happyFail

action_7 (32) = happyShift action_9
action_7 (13) = happyGoto action_8
action_7 _ = happyReduce_25

action_8 (26) = happyShift action_10
action_8 (31) = happyShift action_11
action_8 _ = happyFail

action_9 _ = happyReduce_27

action_10 (32) = happyShift action_13
action_10 _ = happyFail

action_11 (28) = happyShift action_12
action_11 _ = happyFail

action_12 (7) = happyGoto action_14
action_12 _ = happyReduce_5

action_13 _ = happyReduce_26

action_14 (20) = happyShift action_21
action_14 (22) = happyShift action_22
action_14 (23) = happyShift action_23
action_14 (24) = happyShift action_24
action_14 (25) = happyShift action_25
action_14 (27) = happyShift action_26
action_14 (29) = happyShift action_27
action_14 (30) = happyShift action_28
action_14 (32) = happyShift action_29
action_14 (53) = happyShift action_30
action_14 (54) = happyShift action_31
action_14 (55) = happyShift action_32
action_14 (56) = happyShift action_33
action_14 (57) = happyShift action_34
action_14 (58) = happyShift action_35
action_14 (59) = happyShift action_36
action_14 (60) = happyShift action_37
action_14 (61) = happyShift action_38
action_14 (8) = happyGoto action_15
action_14 (9) = happyGoto action_16
action_14 (10) = happyGoto action_17
action_14 (11) = happyGoto action_18
action_14 (12) = happyGoto action_19
action_14 (15) = happyGoto action_20
action_14 _ = happyFail

action_15 _ = happyReduce_6

action_16 _ = happyReduce_7

action_17 (21) = happyShift action_59
action_17 _ = happyReduce_12

action_18 _ = happyReduce_10

action_19 (34) = happyShift action_57
action_19 (35) = happyShift action_58
action_19 _ = happyReduce_18

action_20 _ = happyReduce_19

action_21 (30) = happyShift action_56
action_21 _ = happyFail

action_22 (30) = happyShift action_55
action_22 _ = happyFail

action_23 _ = happyReduce_9

action_24 _ = happyReduce_21

action_25 (30) = happyShift action_54
action_25 _ = happyFail

action_26 (24) = happyShift action_24
action_26 (27) = happyShift action_26
action_26 (30) = happyShift action_28
action_26 (32) = happyShift action_29
action_26 (53) = happyShift action_30
action_26 (54) = happyShift action_31
action_26 (55) = happyShift action_32
action_26 (56) = happyShift action_33
action_26 (57) = happyShift action_34
action_26 (58) = happyShift action_35
action_26 (59) = happyShift action_36
action_26 (60) = happyShift action_37
action_26 (61) = happyShift action_38
action_26 (12) = happyGoto action_53
action_26 (15) = happyGoto action_20
action_26 _ = happyFail

action_27 _ = happyReduce_4

action_28 (24) = happyShift action_24
action_28 (27) = happyShift action_26
action_28 (30) = happyShift action_28
action_28 (32) = happyShift action_29
action_28 (53) = happyShift action_30
action_28 (54) = happyShift action_31
action_28 (55) = happyShift action_32
action_28 (56) = happyShift action_33
action_28 (57) = happyShift action_34
action_28 (58) = happyShift action_35
action_28 (59) = happyShift action_36
action_28 (60) = happyShift action_37
action_28 (61) = happyShift action_38
action_28 (11) = happyGoto action_52
action_28 (12) = happyGoto action_19
action_28 (15) = happyGoto action_20
action_28 _ = happyFail

action_29 (30) = happyShift action_50
action_29 (36) = happyShift action_51
action_29 _ = happyFail

action_30 (37) = happyShift action_46
action_30 (38) = happyShift action_47
action_30 (39) = happyShift action_48
action_30 (40) = happyShift action_49
action_30 (18) = happyGoto action_45
action_30 _ = happyFail

action_31 (33) = happyShift action_44
action_31 _ = happyFail

action_32 (33) = happyShift action_43
action_32 _ = happyFail

action_33 _ = happyReduce_36

action_34 _ = happyReduce_37

action_35 (41) = happyShift action_41
action_35 (42) = happyShift action_42
action_35 (17) = happyGoto action_40
action_35 _ = happyFail

action_36 _ = happyReduce_32

action_37 (33) = happyShift action_39
action_37 _ = happyFail

action_38 _ = happyReduce_39

action_39 _ = happyReduce_38

action_40 _ = happyReduce_33

action_41 _ = happyReduce_51

action_42 _ = happyReduce_52

action_43 _ = happyReduce_35

action_44 _ = happyReduce_34

action_45 (43) = happyShift action_72
action_45 (44) = happyShift action_73
action_45 (45) = happyShift action_74
action_45 (46) = happyShift action_75
action_45 (47) = happyShift action_76
action_45 (48) = happyShift action_77
action_45 (49) = happyShift action_78
action_45 (50) = happyShift action_79
action_45 (51) = happyShift action_80
action_45 (52) = happyShift action_81
action_45 (16) = happyGoto action_71
action_45 _ = happyFail

action_46 _ = happyReduce_53

action_47 _ = happyReduce_54

action_48 _ = happyReduce_55

action_49 _ = happyReduce_56

action_50 (33) = happyShift action_70
action_50 (14) = happyGoto action_69
action_50 _ = happyReduce_28

action_51 (33) = happyShift action_68
action_51 _ = happyFail

action_52 (31) = happyShift action_67
action_52 _ = happyFail

action_53 _ = happyReduce_20

action_54 (32) = happyShift action_66
action_54 _ = happyFail

action_55 (24) = happyShift action_24
action_55 (27) = happyShift action_26
action_55 (30) = happyShift action_28
action_55 (32) = happyShift action_29
action_55 (53) = happyShift action_30
action_55 (54) = happyShift action_31
action_55 (55) = happyShift action_32
action_55 (56) = happyShift action_33
action_55 (57) = happyShift action_34
action_55 (58) = happyShift action_35
action_55 (59) = happyShift action_36
action_55 (60) = happyShift action_37
action_55 (61) = happyShift action_38
action_55 (11) = happyGoto action_65
action_55 (12) = happyGoto action_19
action_55 (15) = happyGoto action_20
action_55 _ = happyFail

action_56 (24) = happyShift action_24
action_56 (27) = happyShift action_26
action_56 (30) = happyShift action_28
action_56 (32) = happyShift action_29
action_56 (53) = happyShift action_30
action_56 (54) = happyShift action_31
action_56 (55) = happyShift action_32
action_56 (56) = happyShift action_33
action_56 (57) = happyShift action_34
action_56 (58) = happyShift action_35
action_56 (59) = happyShift action_36
action_56 (60) = happyShift action_37
action_56 (61) = happyShift action_38
action_56 (11) = happyGoto action_64
action_56 (12) = happyGoto action_19
action_56 (15) = happyGoto action_20
action_56 _ = happyFail

action_57 (24) = happyShift action_24
action_57 (27) = happyShift action_26
action_57 (30) = happyShift action_28
action_57 (32) = happyShift action_29
action_57 (53) = happyShift action_30
action_57 (54) = happyShift action_31
action_57 (55) = happyShift action_32
action_57 (56) = happyShift action_33
action_57 (57) = happyShift action_34
action_57 (58) = happyShift action_35
action_57 (59) = happyShift action_36
action_57 (60) = happyShift action_37
action_57 (61) = happyShift action_38
action_57 (11) = happyGoto action_63
action_57 (12) = happyGoto action_19
action_57 (15) = happyGoto action_20
action_57 _ = happyFail

action_58 (24) = happyShift action_24
action_58 (27) = happyShift action_26
action_58 (30) = happyShift action_28
action_58 (32) = happyShift action_29
action_58 (53) = happyShift action_30
action_58 (54) = happyShift action_31
action_58 (55) = happyShift action_32
action_58 (56) = happyShift action_33
action_58 (57) = happyShift action_34
action_58 (58) = happyShift action_35
action_58 (59) = happyShift action_36
action_58 (60) = happyShift action_37
action_58 (61) = happyShift action_38
action_58 (11) = happyGoto action_62
action_58 (12) = happyGoto action_19
action_58 (15) = happyGoto action_20
action_58 _ = happyFail

action_59 (20) = happyShift action_21
action_59 (28) = happyShift action_61
action_59 (9) = happyGoto action_60
action_59 (10) = happyGoto action_17
action_59 _ = happyFail

action_60 _ = happyReduce_13

action_61 (7) = happyGoto action_88
action_61 _ = happyReduce_5

action_62 _ = happyReduce_17

action_63 _ = happyReduce_16

action_64 (31) = happyShift action_87
action_64 _ = happyFail

action_65 (31) = happyShift action_86
action_65 _ = happyFail

action_66 (26) = happyShift action_85
action_66 _ = happyFail

action_67 _ = happyReduce_23

action_68 _ = happyReduce_24

action_69 (26) = happyShift action_83
action_69 (31) = happyShift action_84
action_69 _ = happyFail

action_70 _ = happyReduce_30

action_71 _ = happyReduce_31

action_72 _ = happyReduce_40

action_73 _ = happyReduce_41

action_74 _ = happyReduce_42

action_75 _ = happyReduce_43

action_76 _ = happyReduce_44

action_77 _ = happyReduce_45

action_78 (30) = happyShift action_82
action_78 _ = happyFail

action_79 _ = happyReduce_48

action_80 _ = happyReduce_49

action_81 _ = happyReduce_50

action_82 (32) = happyShift action_94
action_82 (33) = happyShift action_95
action_82 _ = happyFail

action_83 (33) = happyShift action_93
action_83 _ = happyFail

action_84 _ = happyReduce_22

action_85 (33) = happyShift action_92
action_85 _ = happyFail

action_86 (28) = happyShift action_91
action_86 _ = happyFail

action_87 (28) = happyShift action_90
action_87 _ = happyFail

action_88 (20) = happyShift action_21
action_88 (22) = happyShift action_22
action_88 (23) = happyShift action_23
action_88 (24) = happyShift action_24
action_88 (25) = happyShift action_25
action_88 (27) = happyShift action_26
action_88 (29) = happyShift action_89
action_88 (30) = happyShift action_28
action_88 (32) = happyShift action_29
action_88 (53) = happyShift action_30
action_88 (54) = happyShift action_31
action_88 (55) = happyShift action_32
action_88 (56) = happyShift action_33
action_88 (57) = happyShift action_34
action_88 (58) = happyShift action_35
action_88 (59) = happyShift action_36
action_88 (60) = happyShift action_37
action_88 (61) = happyShift action_38
action_88 (8) = happyGoto action_15
action_88 (9) = happyGoto action_16
action_88 (10) = happyGoto action_17
action_88 (11) = happyGoto action_18
action_88 (12) = happyGoto action_19
action_88 (15) = happyGoto action_20
action_88 _ = happyFail

action_89 _ = happyReduce_14

action_90 (7) = happyGoto action_100
action_90 _ = happyReduce_5

action_91 (7) = happyGoto action_99
action_91 _ = happyReduce_5

action_92 (31) = happyShift action_98
action_92 _ = happyFail

action_93 _ = happyReduce_29

action_94 (31) = happyShift action_97
action_94 _ = happyFail

action_95 (31) = happyShift action_96
action_95 _ = happyFail

action_96 _ = happyReduce_46

action_97 _ = happyReduce_47

action_98 (28) = happyShift action_103
action_98 _ = happyFail

action_99 (20) = happyShift action_21
action_99 (22) = happyShift action_22
action_99 (23) = happyShift action_23
action_99 (24) = happyShift action_24
action_99 (25) = happyShift action_25
action_99 (27) = happyShift action_26
action_99 (29) = happyShift action_102
action_99 (30) = happyShift action_28
action_99 (32) = happyShift action_29
action_99 (53) = happyShift action_30
action_99 (54) = happyShift action_31
action_99 (55) = happyShift action_32
action_99 (56) = happyShift action_33
action_99 (57) = happyShift action_34
action_99 (58) = happyShift action_35
action_99 (59) = happyShift action_36
action_99 (60) = happyShift action_37
action_99 (61) = happyShift action_38
action_99 (8) = happyGoto action_15
action_99 (9) = happyGoto action_16
action_99 (10) = happyGoto action_17
action_99 (11) = happyGoto action_18
action_99 (12) = happyGoto action_19
action_99 (15) = happyGoto action_20
action_99 _ = happyFail

action_100 (20) = happyShift action_21
action_100 (22) = happyShift action_22
action_100 (23) = happyShift action_23
action_100 (24) = happyShift action_24
action_100 (25) = happyShift action_25
action_100 (27) = happyShift action_26
action_100 (29) = happyShift action_101
action_100 (30) = happyShift action_28
action_100 (32) = happyShift action_29
action_100 (53) = happyShift action_30
action_100 (54) = happyShift action_31
action_100 (55) = happyShift action_32
action_100 (56) = happyShift action_33
action_100 (57) = happyShift action_34
action_100 (58) = happyShift action_35
action_100 (59) = happyShift action_36
action_100 (60) = happyShift action_37
action_100 (61) = happyShift action_38
action_100 (8) = happyGoto action_15
action_100 (9) = happyGoto action_16
action_100 (10) = happyGoto action_17
action_100 (11) = happyGoto action_18
action_100 (12) = happyGoto action_19
action_100 (15) = happyGoto action_20
action_100 _ = happyFail

action_101 _ = happyReduce_15

action_102 _ = happyReduce_8

action_103 (7) = happyGoto action_104
action_103 _ = happyReduce_5

action_104 (20) = happyShift action_21
action_104 (22) = happyShift action_22
action_104 (23) = happyShift action_23
action_104 (24) = happyShift action_24
action_104 (25) = happyShift action_25
action_104 (27) = happyShift action_26
action_104 (29) = happyShift action_105
action_104 (30) = happyShift action_28
action_104 (32) = happyShift action_29
action_104 (53) = happyShift action_30
action_104 (54) = happyShift action_31
action_104 (55) = happyShift action_32
action_104 (56) = happyShift action_33
action_104 (57) = happyShift action_34
action_104 (58) = happyShift action_35
action_104 (59) = happyShift action_36
action_104 (60) = happyShift action_37
action_104 (61) = happyShift action_38
action_104 (8) = happyGoto action_15
action_104 (9) = happyGoto action_16
action_104 (10) = happyGoto action_17
action_104 (11) = happyGoto action_18
action_104 (12) = happyGoto action_19
action_104 (15) = happyGoto action_20
action_104 _ = happyFail

action_105 _ = happyReduce_11

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
happyReduction_19 (HappyAbsSyn15  happy_var_1)
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
happyReduction_29 (HappyTerminal (TokenInteger happy_var_3))
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_3 : happy_var_1
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  14 happyReduction_30
happyReduction_30 (HappyTerminal (TokenInteger happy_var_1))
	 =  HappyAbsSyn14
		 ([happy_var_1]
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  15 happyReduction_31
happyReduction_31 (HappyAbsSyn16  happy_var_3)
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Sense happy_var_2 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  15 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn15
		 (Move
	)

happyReduce_33 = happySpecReduce_2  15 happyReduction_33
happyReduction_33 (HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (Turn happy_var_2
	)
happyReduction_33 _ _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_2  15 happyReduction_34
happyReduction_34 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn15
		 (Mark happy_var_2
	)
happyReduction_34 _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_2  15 happyReduction_35
happyReduction_35 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn15
		 (Unmark happy_var_2
	)
happyReduction_35 _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  15 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn15
		 (PickUp
	)

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn15
		 (Drop
	)

happyReduce_38 = happySpecReduce_2  15 happyReduction_38
happyReduction_38 (HappyTerminal (TokenInteger happy_var_2))
	_
	 =  HappyAbsSyn15
		 (Flip happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn15
		 (Nop
	)

happyReduce_40 = happySpecReduce_1  16 happyReduction_40
happyReduction_40 _
	 =  HappyAbsSyn16
		 (Friend
	)

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 _
	 =  HappyAbsSyn16
		 (Foe
	)

happyReduce_42 = happySpecReduce_1  16 happyReduction_42
happyReduction_42 _
	 =  HappyAbsSyn16
		 (FriendWithFood
	)

happyReduce_43 = happySpecReduce_1  16 happyReduction_43
happyReduction_43 _
	 =  HappyAbsSyn16
		 (FoeWithFood
	)

happyReduce_44 = happySpecReduce_1  16 happyReduction_44
happyReduction_44 _
	 =  HappyAbsSyn16
		 (Food
	)

happyReduce_45 = happySpecReduce_1  16 happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn16
		 (Rock
	)

happyReduce_46 = happyReduce 4 16 happyReduction_46
happyReduction_46 (_ `HappyStk`
	(HappyTerminal (TokenInteger happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (Marker happy_var_3
	) `HappyStk` happyRest

happyReduce_47 = happyReduce 4 16 happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyTerminal (TokenIdentifier happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn16
		 (MarkerVar happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_1  16 happyReduction_48
happyReduction_48 _
	 =  HappyAbsSyn16
		 (FoeMarker
	)

happyReduce_49 = happySpecReduce_1  16 happyReduction_49
happyReduction_49 _
	 =  HappyAbsSyn16
		 (Home
	)

happyReduce_50 = happySpecReduce_1  16 happyReduction_50
happyReduction_50 _
	 =  HappyAbsSyn16
		 (FoeHome
	)

happyReduce_51 = happySpecReduce_1  17 happyReduction_51
happyReduction_51 _
	 =  HappyAbsSyn17
		 (IsLeft
	)

happyReduce_52 = happySpecReduce_1  17 happyReduction_52
happyReduction_52 _
	 =  HappyAbsSyn17
		 (IsRight
	)

happyReduce_53 = happySpecReduce_1  18 happyReduction_53
happyReduction_53 _
	 =  HappyAbsSyn18
		 (Here
	)

happyReduce_54 = happySpecReduce_1  18 happyReduction_54
happyReduction_54 _
	 =  HappyAbsSyn18
		 (Ahead
	)

happyReduce_55 = happySpecReduce_1  18 happyReduction_55
happyReduction_55 _
	 =  HappyAbsSyn18
		 (LeftAhead
	)

happyReduce_56 = happySpecReduce_1  18 happyReduction_56
happyReduction_56 _
	 =  HappyAbsSyn18
		 (RightAhead
	)

happyNewToken action sts stk [] =
	action 62 62 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenFunction -> cont 19;
	TokenIf -> cont 20;
	TokenElse -> cont 21;
	TokenWhile -> cont 22;
	TokenBreak -> cont 23;
	TokenTrue -> cont 24;
	TokenTimes -> cont 25;
	TokenComma -> cont 26;
	TokenNot -> cont 27;
	TokenBraceLeft -> cont 28;
	TokenBraceRight -> cont 29;
	TokenParensLeft -> cont 30;
	TokenParensRight -> cont 31;
	TokenIdentifier happy_dollar_dollar -> cont 32;
	TokenInteger happy_dollar_dollar -> cont 33;
	TokenAnd -> cont 34;
	TokenOr -> cont 35;
	TokenComparison happy_dollar_dollar -> cont 36;
	TokenHere -> cont 37;
	TokenAhead -> cont 38;
	TokenLeftAhead -> cont 39;
	TokenRightAhead -> cont 40;
	TokenLeft -> cont 41;
	TokenRight -> cont 42;
	TokenFriend -> cont 43;
	TokenFoe -> cont 44;
	TokenFriendWithFood -> cont 45;
	TokenFoeWithFood -> cont 46;
	TokenFood -> cont 47;
	TokenRock -> cont 48;
	TokenMarker -> cont 49;
	TokenFoeMarker -> cont 50;
	TokenHome -> cont 51;
	TokenFoeHome -> cont 52;
	TokenSense -> cont 53;
	TokenMark -> cont 54;
	TokenUnmark -> cont 55;
	TokenPickUp -> cont 56;
	TokenDrop -> cont 57;
	TokenTurn -> cont 58;
	TokenMove -> cont 59;
	TokenFlip -> cont 60;
	TokenNop -> cont 61;
	_ -> happyError' (tk:tks)
	}

happyError_ 62 tk tks = happyError' tks
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
