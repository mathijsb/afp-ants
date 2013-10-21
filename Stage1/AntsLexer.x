
{
module AntsLexer (lexAntsString) where

import System.IO
import Control.Monad
import AntsBase

}

%wrapper "basic"

$digit = 0-9			   -- digits
$alpha = [a-zA-Z]		 -- alphabetic characters

------------------------------------------
-- Scanner definition for Ant language.

tokens :-

  -- Whitespace & comments.
  $white+							;
  "--".*							;

  function        { \s -> TokenFunction }
  if              { \s -> TokenIf }
  else            { \s -> TokenElse }
  \{              { \s -> TokenBraceLeft }
  \}              { \s -> TokenBraceRight }
  \(              { \s -> TokenParensLeft }
  \)              { \s -> TokenParensRight }

  -- Identifiers
  [$alpha $digit \+ \-]+			{ \s -> TokenIdentifier s }

{

-- | Parses a string to an array of Ant tokens.	
lexAntsString = alexScanTokens

}