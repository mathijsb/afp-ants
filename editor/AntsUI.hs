{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign.C.Types(CInt(..), CWchar(..), CChar(..), CDouble(..))
import Graphics.UI.WXCore.WxcTypes
import Graphics.UI.WXCore.WxcClassTypes

import Graphics.UI.WXCore
import Graphics.UI.WX
import Debug.Trace
import Data.Bits

--parameters
blockW = 100
blockH = 50
yOffset = 20
xOffset = 5
screenW = 800
screenH = 600
-------------

main :: IO ()
main = start antsUI

antsUI :: IO ()
antsUI 	= do 

		f		<- frame [text := "AntsBuilder 0.1"]
		
		-- taksbar menu
		file	<- menuPane      [text := "&Bestand"]
		open	<- menuItem file [text := "&Laden\tCtrl+O",  help := "Open een instructieset"]
		save    <- menuItem file [text := "&Bewaren\tCtrl+S", help := "Bewaar een instructieset"]
		quit   	<- menuQuit file [help := "Afsluiten"]
		
		status <- statusField   [text := ""]
		
		-- panel for the workspace
		p <- panelCreate f idAny rectNull 0
		
		editor <- aslEditor p [text := ""]
 		editor2 <- afaEditor p [text := ""]
 		editor3 <- antEditor p [text := ""]

 		logtext <- textCtrlEx f wxHSCROLL [font := fontFixed,
 				 wrap := WrapNone,
				 text := ""]

		set p [layout := row 5 [fill $ widget editor, fill $ widget editor2, fill $ widget editor3]]

		set f [layout           := stretch $ fill $ column 5 [stretch $ fill $ widget p, stretch $ fill $ widget logtext],
			  statusBar := [status],
			  menuBar := [file],
			  outerSize        := sz screenW screenH,
			  on (menu quit)   := close f,
			  on (menu open)   := undefined, --TODO
			  on (menu save)   := undefined] --TODO
		where
			loadWorkspace = undefined 				--TODO
			saveWorkspace = undefined				--TODO

codeEditor p prop = do
    ed <- styledTextCtrlEx p (wxHSCROLL .|. wxTE_MULTILINE) prop
    styledTextCtrlSetMarginType ed 0 wxSTC_MARGIN_TEXT
    styledTextCtrlSetMarginWidth ed 0 22
    styledTextCtrlSetMarginWidth ed 1 0
    styledTextCtrlSetMarginWidth ed 2 0
    styledTextCtrlStyleSetSpec ed wxSTC_STYLE_LINENUMBER "size:10,face:monospace"
    styledTextCtrlStyleSetSpec ed wxSTC_STYLE_DEFAULT "size:12,face:monospace"
    styledTextCtrlSetCaretLineBackground ed (rgb 240 240 240)
    styledTextCtrlSetCaretLineVisible ed True
    styledTextCtrlSetTabWidth ed 4
    styledTextCtrlSetUseTabs ed False
    return ed


-- TODO: add more keywords?
-- TODO: This assumes comments are started with // instead of --: maybe we can change the compiler to reflect that.
aslEditor p prop = do
    ed <- codeEditor p prop
    styledTextCtrlStyleClearAll ed
    styledTextCtrlSetLexer ed wxSTC_LEX_CPP 
    styledTextCtrlStyleSetForeground ed wxSTC_C_NUMBER (rgb 255 0 255)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD (rgb 0 0 150)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD2 (rgb 0 150 0)
    styledTextCtrlStyleSetForeground ed wxSTC_C_COMMENTLINE (rgb 0 0 255)
    styledTextCtrlStyleSetBold ed wxSTC_C_WORD True
    styledTextCtrlSetKeyWords ed 0 "times function while true if else break Sense Turn Mark PickUp Move Drop Nop Flip"
    styledTextCtrlSetKeyWords ed 1 "Marker Left Right Ahead LeftAhead RightAhead Here Home"
    set ed [on stcEvent := updateLabels ed 1]
    return ed

afaEditor p prop = do
    ed <- codeEditor p prop
    styledTextCtrlStyleClearAll ed
    styledTextCtrlSetLexer ed wxSTC_LEX_CPP 
    styledTextCtrlStyleSetForeground ed wxSTC_C_NUMBER (rgb 255 0 255)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD (rgb 0 0 150)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD2 (rgb 0 150 0)
    styledTextCtrlStyleSetForeground ed wxSTC_C_IDENTIFIER (rgb 150 0 0)
    styledTextCtrlStyleSetBold ed wxSTC_C_WORD True
    styledTextCtrlSetKeyWords ed 0 "SENSE TURN MARK PICKUP MOVE DROP NOP FLIP OR GOTO JUMP"
    styledTextCtrlSetKeyWords ed 1 "MARKER LEFT RIGHT AHEAD LEFTAHEAD RIGHTAHEAD HERE HOME"
    set ed [on stcEvent := updateLabels ed 1]
    return ed

antEditor p prop = do
    ed <- codeEditor p prop
    styledTextCtrlStyleClearAll ed
    styledTextCtrlSetLexer ed wxSTC_LEX_CPP 
    styledTextCtrlStyleSetForeground ed wxSTC_C_NUMBER (rgb 255 0 255)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD (rgb 0 0 150)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD2 (rgb 0 150 0)
    styledTextCtrlStyleSetBold ed wxSTC_C_WORD True
    styledTextCtrlSetKeyWords ed 0 "Sense Turn Mark PickUp Move Drop Flip"
    styledTextCtrlSetKeyWords ed 1 "Marker Left Right Ahead LeftAhead RightAhead Here Home"
    set ed [on stcEvent := updateLabels ed 0]
    return ed

updateLabels :: StyledTextCtrl a -> Int -> EventSTC -> IO ()
updateLabels c n (STCUpdateUI) = do
    t <- styledTextCtrlLinesOnScreen c
    f <- styledTextCtrlGetFirstVisibleLine c
    mapM_ (\l -> styledTextCtrlMarginSetText c l (show (l + n))) [f..f+t]
updateLabels _ _ _ = return ()

wxSTC_MARGIN_TEXT :: Int
wxSTC_MARGIN_TEXT = 4

-- | usage: (@styledTextCtrlMarginSetText obj line text@).
styledTextCtrlMarginSetText :: StyledTextCtrl  a -> Int -> String ->  IO ()
styledTextCtrlMarginSetText _obj line text 
  = withObjectRef "styledTextCtrlMarginSetText" _obj $ \cobj__obj -> 
    withStringPtr text $ \cobj_text -> 
    wxStyledTextCtrl_MarginSetText cobj__obj (toCInt line) cobj_text  
foreign import ccall "wxStyledTextCtrl_MarginSetText" wxStyledTextCtrl_MarginSetText :: Ptr (TStyledTextCtrl a) -> CInt -> Ptr (TWxString b) -> IO ()


