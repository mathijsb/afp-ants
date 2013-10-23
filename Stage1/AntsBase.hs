module AntsBase 
	(
		AntsToken(..),
		Program(..),
		Function(..),
		Direction(..),
		Condition(..),
		Statement(..),
		AntsAlgebra,
		foldAntsAlgebra
	) 
	where
		
------------------------------------------
-- Token type for Ants language.

type Ident = String

data AntsToken =	
	TokenFunction			|
	TokenIf         		|
	TokenElse				|
	TokenBraceLeft			|
	TokenBraceRight			|
	TokenParensLeft			|
	TokenParensRight		|
	TokenIdentifier Ident 	|

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

data Direction = 
	Here
	| Ahead
	| LeftAhead
	| RightAhead
	deriving (Eq, Show)

data Condition =
	Friend
	| Foe
	| FriendWithFood
	| FoeWithFood
	| Food
	| Rock
	| Marker
	| FoeMarker
	| Home
	| FoeHome
	deriving (Eq, Show)

data Program = Program [Function]
	deriving (Eq, Show)

data Function = Function Ident [Statement]
	deriving (Eq, Show)

data Statement = Sense Direction Condition
			   | Move
			   | If [Statement] [Statement] [Statement]
	deriving (Eq, Show)


------------------------------------------

-- Type for an algebra folding Ants programs.
type AntsAlgebra program function statement =
	(
		-- Program
		([function] -> program),
		
		-- Function
		(Ident -> [statement] -> function),

		-- Statement
		(([statement] -> [statement] -> [statement] -> statement),
		 (Statement -> statement))

		
	)

-- | Fold function for the ants algebra.
foldAntsAlgebra :: AntsAlgebra p f s -> Program -> p
foldAntsAlgebra (p,f,(s1, s2)) = foldProgram
	where
		foldProgram (Program functions) = p (map foldFunction functions)
		foldFunction (Function ident statements) = f ident (map foldStatement statements)
		foldStatement (If sts1 sts2 sts3) = s1 (map foldStatement sts1) (map foldStatement sts1) (map foldStatement sts1)
		foldStatement statement = s2 statement
