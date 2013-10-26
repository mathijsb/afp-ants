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
  true              { TokenTrue }

  '!'               { TokenNot }
  '{'               { TokenBraceLeft }
  '}'               { TokenBraceRight }
  '('               { TokenParensLeft }
  ')'               { TokenParensRight }
  Ident             { TokenIdentifier $$ }
  Int               { TokenInteger $$ }
  '&&'              { TokenAnd }
  '||'              { TokenOr }

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

statement  : if_statement                                   { $1 [] }
           | if_statement else if_statement                 { $1 ([$3 []]) }
           | if_statement else '{' statements '}'           { $1 (reverse $4) }

           | while '(' expression ')' '{' statements '}'    { While $3 (reverse $6)}

           | break                                          { Break }
           | expression                                     { Expr $1 }

if_statement : if '(' expression ')' '{' statements '}'  { If $3 (reverse $6) }


expression : expression1 '&&' expression      { And $1 $3 }
           | expression1 '||' expression      { Or $1 $3 }
           | expression1                      { $1 }

expression1   : Sense sense_direction condition { Sense $2 $3 }
              | Move                            { Move }
              | Turn direction                  { Turn $2 }
              | Mark Int                        { Mark $2 }
              | Unmark Int                      { Unmark $2 }
              | PickUp                          { PickUp }
              | Drop                            { Drop }
              | Flip Int                        { Flip $2 }
              | '!' expression1                 { Not $2 }
              | true                            { BoolExpression True }
              | Ident '(' ')'                   { FunctionCall $1 }
              | '(' expression ')'              { $2 }

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

toList x = [x]

-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens

}