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
	deriving (Eq, Show)


------------------------------------------

-- Type for an algebra folding Ants programs.
type AntsAlgebra program function =
	(
		-- Program
		([function] -> program),
		
		-- Rule
		(Ident -> function)
		
	)

-- | Fold function for the ants algebra.
foldAntsAlgebra :: AntsAlgebra p f -> Program -> p
foldAntsAlgebra (p,f) = foldProgram
	where
		foldProgram (Program functions) = p (map foldFunction functions)
		foldFunction (Function ident statements) = f ident
