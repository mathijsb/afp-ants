{
module AntsParser where

import AntsBase

}

%name parseAntsTokens
%tokentype { AntsToken }
%error { parseError }

------------------------------------------
-- Ants language token definitions.

%token 

  function          { TokenFunction }
  if                { TokenIf }
  else              { TokenElse }
  '{'               { TokenBraceLeft }
  '}'               { TokenBraceRight }
  '('               { TokenParensLeft }
  ')'               { TokenParensRight }
  Ident             { TokenIdentifier $$ }

  Here              { TokenHere }
  Ahead             { TokenAhead }
  LeftAhead         { TokenLeftAhead }
  TokenRightAhead   { TokenRightAhead }

  Friend 			{ TokenFriend }
  Foe 				{ TokenFoe }
  FriendWithFood 	{ TokenFriendWithFood }
  FoeWithFood       { TokenFoeWithFood }
  Food              { TokenFood }
  Rock              { TokenRock	}
  Marker            { TokenMarker }
  FoeMarker         { TokenFoeMarker }
  Home              { TokenHome }
  FoeHome           { TokenFoeHome }

  Sense             { TokenSense }
  Mark              { TokenMark }
  Unmark            { TokenUnmark }
  PickUp            { TokenPickUp }
  Drop              { TokenDrop	}
  Turn              { TokenTurn	}
  Move              { TokenMove	}
  Flip              { TokenFlip	}

%%

------------------------------------------
-- Ants language grammar

program  	: funcs    	     	   			         { Program $1 }

funcs : {- empty -}           	             { [] }
      | funcs	func     	                     { $2 : $1 }

func  : function Ident '{' lines '}'         { Function $2 $4 }

lines : {- empty -}                          { [] }
      | lines line                           { $2 : $1 }

line  : Sense Ahead Friend                   { Sense Ahead Friend }


{

-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens

}