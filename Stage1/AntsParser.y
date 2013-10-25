{
module Stage1.AntsParser where

import Stage1.AntsBase
import Common.Simulator (SenseDir(..), LeftOrRight(..), Condition(..), MarkerNumber(..))

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
  break             { TokenBreak }

  '{'               { TokenBraceLeft }
  '}'               { TokenBraceRight }
  '('               { TokenParensLeft }
  ')'               { TokenParensRight }
  Ident             { TokenIdentifier $$ }
  Int               { TokenInteger $$ }

  Here              { TokenHere }
  Ahead             { TokenAhead }
  LeftAhead         { TokenLeftAhead }
  RightAhead        { TokenRightAhead }

  Left              { TokenLeft } 
  Right             { TokenRight }

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
           | while '{' statements '}' {While [] (reverse $3)}
           | break                           { Break }
           | command                         { $1 }

command    : Sense sense_direction condition { Sense $2 $3 }
           | Move                            { Move }
           | Turn direction                  { Turn $2 }
           | Mark Int                        { Mark $2 }
           | Unmark Int                      { Unmark $2 }
           | PickUp                          { PickUp }
           | Drop                            { Drop }
           | Flip Int                        { Flip $2 }


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

direction : Left                             { IsLeft }
          | Right                            { IsRight }

sense_direction : Here                             { Here }
                | Ahead                            { Ahead }
                | LeftAhead                        { LeftAhead }
                | RightAhead                       { RightAhead }


{

-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens

}