module Stage1.AntsBase 
	(
		AntsToken(..),
		Program(..),
		Function(..),
		SenseDir(..),
		Condition(..),
		Expression(..),
		LeftOrRight(..),
		Statement(..),
		Command(..),
		ComparisonType(..),
		AntsAlgebra,
		foldAntsAlgebra
	) 
	where

import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))
		
------------------------------------------
-- Token type for Ants language.

type Ident = String

data AntsToken =	

	TokenFunction			|
	TokenIf         		|
	TokenElse				|
	TokenWhile				|
	TokenBraceLeft			|
	TokenBraceRight			|
	TokenParensLeft			|
	TokenParensRight		|
	TokenBreak              |
	TokenNot 				|
    TokenTrue               |
    TokenAnd 				|
    TokenOr 				|
    TokenTimes 				|
    TokenComma              |

    TokenComparison ComparisonType |

	TokenIdentifier Ident 	|
	TokenInteger Int        |

	TokenLeft               |
	TokenRight 				|

	TokenHere				|
	TokenAhead				|
	TokenLeftAhead			|
	TokenRightAhead			|

	TokenFriend				|
	TokenFoe				|
	TokenFriendWithFood		|
	TokenFoeWithFood		|
	TokenFood 				|
	TokenRock				|
	TokenMarker             |
	TokenFoeMarker          |
	TokenHome               |
	TokenFoeHome            |

	TokenSense				|
	TokenMark               |
	TokenUnmark				|
	TokenPickUp				|
	TokenDrop				|
	TokenTurn				|
	TokenMove				|
	TokenFlip				

	deriving (Eq,Show)

------------------------------------------
-- Data structure for Ants language

data Program = Program [Function]
	deriving (Show)

data Function = Function Ident [Statement] [String]
	deriving (Show)

data Statement = If Expression [Statement] [Statement]
			   | While Expression [Statement]
			   | Break
			   | Expr Expression
			   | Times String Int [Statement]
	deriving (Show)

data Expression = ExpressionCommand Command
			    | Not Expression
			    | BoolExpression Bool
			    | FunctionCall String [Int]
			    | And Expression Expression
			    | Or Expression Expression
			    | Comparison ComparisonType String Int

	deriving (Show)

data ComparisonType = CLT | CGT | CLE | CGE | CEQ | CNE deriving (Show, Eq)

data Command = Sense SenseDir Condition
			 	| Move
			    | Mark MarkerNumber
			    | Unmark MarkerNumber
			    | PickUp
			    | Drop
			    | Turn LeftOrRight
			    | Flip Int
	deriving (Show)

------------------------------------------

-- Type for an algebra folding Ants programs.
type AntsAlgebra program function statement expression command =
	(
		-- Program
		([function] -> program),
		
		-- Function
		(Ident -> [String] -> [statement] -> function),

		-- Statement
		((expression -> [statement] -> [statement] -> statement),
		 (expression -> [statement] -> statement),
		 statement,
		 expression -> statement,
		 String -> Int -> [statement] -> statement),

		-- Expression
		((command -> expression),
		 (expression -> expression),
		 Bool -> expression,
		 (String -> [Int] -> expression),
		 (expression -> expression -> expression),
		 (expression -> expression -> expression),
		 ComparisonType -> String -> Int -> expression),

		-- Command
		(Command -> command)

	)

-- | Fold function for the ants algebra.
foldAntsAlgebra :: AntsAlgebra p f s e c -> Program -> p
foldAntsAlgebra (p, f, (s1, s2, s3, s4, s5), (e1, e2, e3, e4, e5, e6, e7), c) = foldProgram
	where
		foldProgram (Program functions) = p (map foldFunction functions)
		foldFunction (Function ident statements decls) = f ident decls (map foldStatement statements)
		foldStatement (If expr sts2 sts3) = s1 (foldExpression expr) (map foldStatement sts2) (map foldStatement sts3)
		foldStatement (While expr sts2) = s2 (foldExpression expr) (map foldStatement sts2)
		foldStatement Break = s3
		foldStatement (Expr expr) = s4 . foldExpression $ expr
		foldStatement (Times var times sts) = s5 var times (map foldStatement sts)

		foldExpression (ExpressionCommand command) = e1 . foldCommand $ command
		foldExpression (Not expression) = e2 (foldExpression expression)
		foldExpression (BoolExpression bool) = e3 bool
		foldExpression (FunctionCall str args) = e4 str args
		foldExpression (And expr1 expr2) = e5 (foldExpression expr1) (foldExpression expr2)
		foldExpression (Or expr1 expr2) = e6 (foldExpression expr1) (foldExpression expr2)
		foldExpression (Comparison eq var val) = e7 eq var val

		foldCommand command = c command
