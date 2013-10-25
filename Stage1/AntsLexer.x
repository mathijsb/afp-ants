
{
module Stage1.AntsLexer (lexAntsString) where

import System.IO
import Control.Monad
import Stage1.AntsBase

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
  !               { \s -> TokenNot }

  if              { \s -> TokenIf }
  else            { \s -> TokenElse }
  while           { \s -> TokenWhile }
  break           { \s -> TokenBreak }
  true            { \s -> TokenTrue }

  Left            { \s -> TokenLeft }
  Right           { \s -> TokenRight }

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

  $digit+                   { \s -> TokenInteger (read s) }
  [$alpha $digit \+ \-]+			{ \s -> TokenIdentifier s }

{

-- | Parses a string to an array of Ant tokens.	
lexAntsString = alexScanTokens

}