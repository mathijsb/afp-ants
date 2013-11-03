{-# LANGUAGE CPP #-}

module IDE.Main where

import Graphics.UI.WXCore
import Graphics.UI.WX
import Debug.Trace
import Data.Bits
import Data.IORef
import System.FilePath.Posix
import Data.Version
import Control.Exception
import Control.Monad
import Data.Char (toUpper)

import Stage1.AntsLexer
import Stage1.AntsParser
import Stage1.AntsCompiler
import Stage1.AntsPrettyPrinter

import Stage2.Base (AssemblerException(eLine))
import Stage2.Assembler (assemble, validate)
import Stage2.Parse (parseAssembler)
import Stage2.PrettyPrint (Ant(..))

import IDE.WXExt


#ifdef CABAL_MODULE
import Paths_afp_ants (version)
#else
version :: Version
version = Version [0,1] ["dev"]
#endif

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
title = "AntsEditor " ++ showVersion version

antsUI :: IO ()
antsUI     = do 
        
        f        <- frame [text := title]
        
        -- taksbar menu
        file    <- menuPane      [text := "Bestand"]
        open    <- menuItem file [text := "Script &openen\tCtrl+O"]
        save    <- menuItem file [text := "Script o&pslaan\tCtrl+S"]
        saveAs  <- menuItem file [text := "Script op&slaan als...\tCtrl+Shift+S"]
        menuLine file
        comp    <- menuPane      [text := "Compileren"]
        compile <- menuItem comp [text := "&Compileren\tCtrl+1"]
        export  <- menuItem comp [text := "Compileren &en opslaan...\tCtrl+E"]
        compS   <- menuSub file comp [text := "Compileren"]
        menuLine file
        quit    <- menuQuit file [text := "&Afsluiten\tCtrl+Q"]
        
        status <- statusField   [text := ""]
        
        -- panel for the workspace
        p <- splitterWindow f []
        bottom <- panel p []
        
        current <- newIORef Nothing
        asl <- aslEditor p []
        afa <- afaEditor bottom []
        ant <- antEditor bottom []
         
        let eds = ED { asl = asl, afa = afa, ant = ant, file = current, top = f }
        
        set bottom [layout := fill $ row 5 [fill $ widget afa, fill $ widget ant]]
        set f [layout           := minsize (sz screenW screenH) $ fill $ 
                 hsplit p 5 400 (fill $ widget asl) (fill $ widget bottom),
              statusBar         := [status],
              menuBar           := [file],
              on (menu quit)    := close f,
              on (menu open)    := openASL eds,
              on (menu save)    := saveASL eds False,
              on (menu saveAs)  := saveASL eds True,
              on (menu compile) := void $ compileAnt False eds,
              on (menu export)  := void $ compileAnt True eds]

compileAnt :: Bool -> Editors -> IO (Maybe String)
compileAnt False eds = do
    x <- getText eds asl
    let clearOutput = clear eds [afa, ant]
    withCompilerError clearOutput $ do
        let y = asl2afa x
        setText eds afa $ y
        withAssemblerError $ do
            let z = afa2ant y
            setText eds ant $ z
            return $ Just z
  where errorMarker = 0
        withCompilerError r m = catch m (\e -> r >> compilerError e)
        withAssemblerError m = catch m assemblerError
        compilerError :: SomeException -> IO (Maybe String)
        compilerError e = do errorDialog (top eds) "Compilerfout" (show e)
                             return Nothing
        assemblerError :: AssemblerException -> IO (Maybe String)
        assemblerError e = do let line = eLine e - 1
                                  ed = afa eds
                              styledTextCtrlGotoLine ed line
                              styledTextCtrlMarkerAdd ed line errorMarker
                              clear eds [ant]
                              errorDialog (top eds) "Assemblerfout" (show e)
                              focusOn ed
                              return Nothing
compileAnt True eds = do
    s <- compileAnt False eds
    case s of
      Nothing -> return Nothing
      Just s -> do
        f <- fileSaveDialog (asl eds) True False "Ant opslaan als..." 
             [("Ant-bestanden", ["*.ant"])] "" ""
        case f of
          Nothing -> return Nothing
          Just f -> do
            flip catch (onIOException eds $ return Nothing) $ do
              writeFile f s
              return $ Just s

onIOException :: Editors -> IO a -> IOException -> IO a
onIOException eds m e = errorDialog (top eds) "Invoer/uitvoerfout" (show e) >> m

clear :: Editors -> [Editors -> Editor] -> IO ()
clear es s = mapM_ (\s -> setText es s "" >>
                          styledTextCtrlMarkerDeleteAll (s es) 0) s

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
    f <- fileOpenDialog (asl eds) True True "Instructieset openen..." 
         [("Ant Scripting Language bestanden", ["*.asl"])] "" ""
    case f of
      Nothing -> return ()
      Just f -> do
        flip catch (onIOException eds $ return ()) $ do
            clear eds [afa, ant, asl]
            input <- readFile f
            setCurrentFile eds f
            setText eds asl input

saveASL :: Editors -> Bool -> IO ()
saveASL eds as | as = do
  f <- fileSaveDialog (asl eds) True False "Instructieset opslaan als..." 
       [("Ant Scripting Language bestanden", ["*.asl"])] "" ""
  case f of
      Nothing -> return ()
      Just f -> do
        flip catch (onIOException eds $ return ()) $ do
            output <- getText eds asl
            writeFile f output
            setCurrentFile eds f
               | True = do
  f <- readIORef (file eds)
  case f of
      Nothing -> saveASL eds True
      Just f -> do
        flip catch (onIOException eds $ return ()) $ do
            output <- getText eds asl
            writeFile f output

codeEditor p prop = do
    fixedFont <- findFixedFontFace
    ed <- styledTextCtrlEx p (wxHSCROLL .|. wxTE_MULTILINE) prop
    styledTextCtrlSetMarginType ed 0 wxSTC_MARGIN_TEXT
    styledTextCtrlSetMarginWidth ed 0 45
    styledTextCtrlSetMarginType ed 1 wxSTC_MARGIN_SYMBOL
    styledTextCtrlSetMarginWidth ed 1 10
    styledTextCtrlSetMarginWidth ed 2 0
    styledTextCtrlMarkerDefine ed 0 wxSTC_MARK_CIRCLE red red
    styledTextCtrlStyleSetSpec ed wxSTC_STYLE_LINENUMBER $ "size:8,face:" ++ fixedFont
    styledTextCtrlStyleSetSpec ed wxSTC_STYLE_DEFAULT $ "size:10,face:" ++ fixedFont
    styledTextCtrlSetCaretLineBackground ed (rgb 240 240 240)
    styledTextCtrlSetCaretLineVisible ed True
    styledTextCtrlSetTabWidth ed 4
    styledTextCtrlSetUseTabs ed False
    return ed


-- This assumes comments are started with // instead of --: maybe we can change the compiler to reflect that.
aslEditor p prop = do
    ed <- codeEditor p prop
    styledTextCtrlStyleClearAll ed
    styledTextCtrlSetLexer ed wxSTC_LEX_CPP 
    styledTextCtrlStyleSetForeground ed wxSTC_C_NUMBER (rgb 255 0 255)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD (rgb 0 0 150)
    styledTextCtrlStyleSetForeground ed wxSTC_C_WORD2 (rgb 0 150 0)
    styledTextCtrlStyleSetForeground ed wxSTC_C_COMMENTLINE (rgb 0 0 255)
    styledTextCtrlStyleSetBold ed wxSTC_C_WORD True
    styledTextCtrlSetKeyWords ed 0 aslInstr
    styledTextCtrlSetKeyWords ed 1 aslConds
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
    styledTextCtrlSetKeyWords ed 0 afaInstr
    styledTextCtrlSetKeyWords ed 1 afaConds
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
    styledTextCtrlSetKeyWords ed 0 antInstr
    styledTextCtrlSetKeyWords ed 1 antConds
    set ed [on stcEvent := updateLabels ed 0]
    return ed

updateLabels :: StyledTextCtrl a -> Int -> EventSTC -> IO ()
updateLabels c n (STCUpdateUI) = do
    t <- styledTextCtrlLinesOnScreen c
    f <- styledTextCtrlGetFirstVisibleLine c
    mapM_ (\l -> styledTextCtrlMarginSetText c l (show (l + n))) [f..f+t]
updateLabels _ _ _ = return ()

asl2afa :: String -> String
asl2afa = prettyPrintAfa . compileAnts . parseAntsTokens . lexAntsString

afa2ant :: String -> String
afa2ant s =
    case validate $ parseAssembler s of
      Left e -> throw e
      Right a -> show . Ant . assemble $ a

antInstr = "Sense Mark Unmark PickUp Drop Turn Move Flip"
antConds = "Marker Here Ahead LeftAhead RightAhead Friend Foe FriendWithFood FoeWithFood Food Rock FoeMarker Home FoeHome Left Right"

afaInstr = "NOP JUMP GOTO OR " ++ map toUpper antInstr
afaConds = map toUpper antConds

aslInstr = "function if else while break times && || ! Nop " ++ antInstr
aslConds = "true " ++ antConds

