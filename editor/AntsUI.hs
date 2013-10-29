import Graphics.UI.WXCore
import Graphics.UI.WX
import Debug.Trace

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
		
		editor <- textCtrl p [font := fontFixed,
				 wrap := WrapNone,
				 text := "This is our first step in the " ++
         				 "developing of our text editor.\n" ++
          				 "Just a big text area where " ++
           				 "the user can read and write text\n" ++
            			 "That's not much, but it's just the " ++
 			             "beginning..."]
 		editor2 <- textCtrl p [font := fontFixed,
 				 wrap := WrapNone,
				 text := "This is our first step in the " ++
         				 "developing of our text editor.\n" ++
          				 "Just a big text area where " ++
           				 "the user can read and write text\n" ++
            			 "That's not much, but it's just the " ++
 			             "beginning..."]
 		editor3 <- textCtrlRich p [font := fontFixed,
 				 wrap := WrapNone,
				 text := "This is our first step in the " ++
         				 "developing of our text editor.\n" ++
          				 "Just a big text area where " ++
           				 "the user can read and write text\n" ++
            			 "That's not much, but it's just the " ++
 			             "beginning..."]

		set p [layout := row 3 [fill $ widget editor, fill $ widget editor2, fill $ widget editor3]]

		set f [layout           := stretch $ fill $ widget p,
			  statusBar := [status],
			  menuBar := [file],
			  outerSize        := sz screenW screenH,
			  on (menu quit)   := close f,
			  on (menu open)   := undefined, --TODO
			  on (menu save)   := undefined] --TODO
		where
			loadWorkspace = undefined 				--TODO
			saveWorkspace = undefined				--TODO