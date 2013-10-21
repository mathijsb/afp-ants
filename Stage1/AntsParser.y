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

%%

------------------------------------------
-- Ants language grammar

program  	: functions	     	   			         { Program $1 }

functions : {- empty -}           	         { [] }
      		| functions	function_rule     	   { $2 : $1 }

function_rule : function Ident '{' '}'       { Function $2 }

{

-- | Parsing error handler.
parseError :: [AntsToken] -> a
parseError tokens = error $ show tokens

}