
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
  \{              { \s -> TokenBraceLeft }
  \}              { \s -> TokenBraceRight }
  \(              { \s -> TokenParensLeft }
  \)              { \s -> TokenParensRight }

  if              { \s -> TokenIf }
  else            { \s -> TokenElse }

  Here            { \s -> TokenHere }
  Ahead           { \s -> TokenAhead }
  LeftAhead       { \s -> TokenLeftAhead }
  RightAhead      { \s -> TokenRightAhead }

  Friend                { \s -> TokenFriend }
  Foe                   { \s -> TokenFoe }
  FriendWithFood        { \s -> TokenFriendWithFood }
  FoeWithFood           { \s -> TokenFoeWithFood }
  Food                  { \s -> TokenFood }
  Rock                  { \s -> TokenRock }
  Marker                { \s -> TokenMarker }
  FoeMarker             { \s -> TokenFoeMarker }
  Home                  { \s -> TokenHome }
  FoeHome               { \s -> TokenFoeHome }

  Sense            { \s -> TokenSense }
  Mark             { \s -> TokenMark }
  Unmark           { \s -> TokenUnmark }
  PickUp           { \s -> TokenPickUp }
  Drop             { \s -> TokenDrop }
  Turn             { \s -> TokenTurn }
  Move             { \s -> TokenMove }
  Flip             { \s -> TokenFlip }

  -- Identifiers
  [$alpha $digit \+ \-]+			{ \s -> TokenIdentifier s }

{

-- | Parses a string to an array of Ant tokens.	
lexAntsString = alexScanTokens

}