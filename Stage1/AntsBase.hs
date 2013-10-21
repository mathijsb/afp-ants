module AntsBase 
	(
		AntsToken(..),
		Program(..),
		Function(..)
	) 
	where
		
------------------------------------------
-- Token type for Ants language.

type Ident = String

data AntsToken =	
	TokenFunction		|
	TokenIf         	|
	TokenElse			|
	TokenBraceLeft		|
	TokenBraceRight		|
	TokenParensLeft		|
	TokenParensRight	|
	TokenIdentifier Ident
	deriving (Eq,Show)


------------------------------------------
-- Data structure for Ants language

data Program = Program [Function]
	deriving (Eq, Show)

data Function = Function Ident
	deriving (Eq, Show)