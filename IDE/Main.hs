module IDE.Main where

import Graphics.UI.WXCore
import Graphics.UI.WX
import Debug.Trace
import Data.Bits
import Data.IORef
import System.FilePath.Posix

import IDE.WXExt

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

type Editor = StyledTextCtrl ()
type CurrentFile = IORef (Maybe FilePath)

data Editors = ED { asl :: Editor,
                    afa :: Editor,
                    ant :: Editor,
                    file :: CurrentFile,
                    top :: Frame () }

title :: String
title = "AntsBuilder 0.1"

antsUI :: IO ()
antsUI     = do 

        f        <- frame [text := title]
        
        -- taksbar menu
        file    <- menuPane      [text := "Bestand"]
        open    <- menuItem file [text := "&Openen\tCtrl+O",  help := "Instructieset openen"]
        save    <- menuItem file [text := "O&pslaan\tCtrl+S", help := "Instructieset opslaan"]
        saveAs  <- menuItem file [text := "Op&slaan als...\tCtrl+Shift+S", help := "Instructieset opslaan onder een andere naam"]
        quit       <- menuQuit file [help := "&Afsluiten\tCtrl+Q"]
        
        status <- statusField   [text := ""]
        
        -- panel for the workspace
        progSplit <- splitterWindow f []
        top <- panel progSplit []
        topSplit <- splitterWindow top []
        left <- panel topSplit []
        leftSplit <- splitterWindow left []
        
        
        current <- newIORef Nothing
        asl <- aslEditor leftSplit []
        afa <- afaEditor leftSplit []
        ant <- antEditor topSplit []
         
        let eds = ED { asl = asl, afa = afa, ant = ant, file = current, top = f }

        logtext <- textCtrlEx progSplit wxHSCROLL [font := fontFixed,
                 wrap := WrapNone,
                 text := ""]

        let layoutProg = hsplit progSplit 5 400 (fill $ widget top) (fill $ widget logtext)
            layoutTop  = vsplit topSplit 5 300 (fill $ widget left) (fill $ widget ant)
            layoutLeft = vsplit leftSplit 5 250 (fill $ widget asl) (fill $ widget afa)
        
        set left [layout := fill $ layoutLeft]
        set top [layout := fill $ layoutTop]
        
        set f [layout          := stretch $ fill $ layoutProg,
              statusBar        := [status],
              menuBar          := [file],
              size        := sz screenW screenH,
              on (menu quit)   := close f,
              on (menu open)   := openASL eds,
              on (menu save)   := saveASL eds False,
              on (menu saveAs) := saveASL eds True]

clear :: Editors -> IO ()
clear e = mapM_ (\e -> set e [text := ""]) [asl e, afa e, ant e]

setText :: Editors -> (Editors -> Editor) -> String -> IO ()
setText eds sel = styledTextCtrlSetText (sel eds)

getText :: Editors -> (Editors -> Editor) -> IO String
getText eds sel = styledTextCtrlGetText (sel eds)

setCurrentFile :: Editors -> FilePath -> IO ()
setCurrentFile eds f = do
    writeIORef (file eds) (Just f)
    let (fdir, fname) = splitFileName f
    set (top eds) [text := fname ++ " (" ++ fdir ++ ") - " ++ title]

openASL :: Editors -> IO ()
openASL eds = do
    f <- fileOpenDialog (asl eds) True True "Instructieset openen..." [("Ant Scripting Language bestanden", ["*.asl"])] "" ""
    case f of
      Nothing -> return ()
      Just f -> do
        clear eds
        input <- readFile f
        setCurrentFile eds f
        setText eds asl input

saveASL :: Editors -> Bool -> IO ()
saveASL eds as | as = do
  f <- fileSaveDialog (asl eds) True False "Instructieset opslaan als..." [("Ant Scripting Language bestanden", ["*.asl"])] "" ""
  case f of
      Nothing -> return ()
      Just f -> do
        output <- getText eds asl
        writeFile f output
        setCurrentFile eds f
               | True = do
  f <- readIORef (file eds)
  case f of
      Nothing -> saveASL eds True
      Just f -> do
        output <- getText eds asl
        writeFile f output

codeEditor p prop = do
    ed <- styledTextCtrlEx p (wxHSCROLL .|. wxTE_MULTILINE) prop
    styledTextCtrlSetMarginType ed 0 wxSTC_MARGIN_TEXT
    styledTextCtrlSetMarginWidth ed 0 45
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

