{
module Stage1.AntsParser where

import Stage1.AntsBase

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
  while             { TokenWhile }
  '{'               { TokenBraceLeft }
  '}'               { TokenBraceRight }
  '('               { TokenParensLeft }
  ')'               { TokenParensRight }
  Ident             { TokenIdentifier $$ }

  Here              { TokenHere }
  Ahead             { TokenAhead }
  LeftAhead         { TokenLeftAhead }
  RightAhead        { TokenRightAhead }

  Friend 			      { TokenFriend }
  Foe 				      { TokenFoe }
  FriendWithFood 	  { TokenFriendWithFood }
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

func  : function Ident '{' statements '}'    { Function $2 (reverse $4) }

statements : {- empty -}                     { [] }
           | statements statement            { $2 : $1 }

statement  : if '(' statements ')' '{' statements '}' {If (reverse $3) (reverse $6) []}
           | if '(' statements ')' '{' statements '}' else '{' statements '}' {If (reverse $3) (reverse $6) (reverse $10)}
           | while '(' statements ')' '{' statements '}' {While (reverse $3) (reverse $6)}
           | command                         { $1 }

command    : Sense direction condition       { Sense $2 $3 }
           | Move                            { Move }


condition : Friend                           { Friend }
          | Foe                              { Foe }
          | FriendWithFood                   { FriendWithFood }
          | FoeWithFood                      { FoeWithFood }
          | Food                             { Food }
          | Rock                             { Rock }
          | Marker                           { Marker 0 }
          | FoeMarker                        { FoeMarker }
          | Home                             { Home }
          | FoeHome                          { FoeHome }

direction : Here                             { Here }
          | Ahead                            { Ahead }
          | LeftAhead                        { LeftAhead }
          | RightAhead                       { RightAhead }


{

-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens

}