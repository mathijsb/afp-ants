{-
Hoi! Deze code moet nog gerefactored worden, en staat alleen in de github voor jou vermaak! Groetjes, Nico
-}
import Graphics.UI.WXCore
import Graphics.UI.WX
import Blocks

main :: IO ()
main = start antsUI

--parameters
blockW = 100
blockH = 50
yOffset = 20
xOffset = 5
screenW = 800
screenH = 600
-------------

testworkspace :: WorkspaceTree
testworkspace = IfNode (IfNode Empty Empty ) (StatementNode (StatementNode (IfNode (StatementNode Empty) (StatementNode Empty))))

antsUI :: IO ()
antsUI
	= do 
		f		<- frame [text := "AntsBuilder 0.1"]
		
		-- taksbar menu
		file	<- menuPane      [text := "&Bestand"]
		open	<- menuItem file [text := "&Laden\tCtrl+O",  help := "Open een instructieset"]
		save    <- menuItem file [text := "&Bewaren\tCtrl+S", help := "Bewaar een instructieset"]
		quit   	<- menuQuit file [help := "Afsluiten"]
		
		status <- statusField   [text := ""]
		
		-- panel for the workspace
		
		p <- panelCreate f idAny rectNull 0
		
		windowOnPaintRaw p (paintWorkspace testworkspace p)
		
		-- position of all the elements
		
		set f [layout           := column 1 [minsize (sz 800 600) (widget p), hfill $ hrule 1],
			  statusBar := [status],
			  menuBar := [file],
			  outerSize        := sz screenW screenH,
			  on (menu quit)   := close f,
			  on (menu open)   := undefined, --TODO
			  on (menu save)   := undefined] --TODO
		where
			paintWorkspace workspace p dc viewRect updateAreas
				= do 
					dcClear dc
					(paintBlock dc p (dcWithBrushStyle dc (BrushStyle BrushSolid blue)) 0 0 workspace)
						--paintBlock is best wel een domme functie. Is makkelijk stuk te maken, en doet veel te veel werk. Ga ik nog verbeteren!
			paintBlock dc p br depth sibling (StatementNode Empty) = do	
			 															addButton <- smallButton p [text:= "+", position:= Point ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset))]
 																		set addButton [on command := addWorkspaceNode]
 																		br $ dcDrawRectangle dc (Rect ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)) blockW blockH)
			paintBlock dc p br depth sibling (StatementNode s)	 = do
																	br $ dcDrawRectangle dc (Rect ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)) blockW blockH) 
																	dcDrawLine dc (Point  ((screenW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)+blockH)) (Point ((screenW`div`2)+(sibling*(xOffset+(blockW`div`2)))) ((depth+1)*(blockH+yOffset)))
																	br (paintBlock dc p br (depth+1) sibling s)
			paintBlock dc p br depth sibling (IfNode Empty Empty)	 = do
																		addLeft <- smallButton p [text:= "+", position:= Point ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset))]
																	 	set addLeft [on command := addWorkspaceNode]
																	 	addRight <- smallButton p [text:= "+", position:= Point ((screenW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset))]
																	 	set addRight [on command := addWorkspaceNode]
																	 	br $ dcDrawRectangle dc (Rect ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)) blockW blockH)
			paintBlock dc p br depth sibling (IfNode t f)			 = do
																	br $ dcDrawRectangle dc (Rect ((screenW`div`2)-(blockW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)) blockW blockH)
																	dcDrawLine dc (Point  ((screenW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)+blockH)) (Point ((screenW`div`2)+((sibling-(workspaceWidth t))*(xOffset+(blockW`div`2)))) ((depth+1)*(blockH+yOffset)))
																	dcDrawLine dc (Point  ((screenW`div`2)+(sibling*(xOffset+(blockW`div`2)))) (depth*(blockH+yOffset)+blockH)) (Point ((screenW`div`2)+((sibling+(workspaceWidth f))*(xOffset+(blockW`div`2)))) ((depth+1)*(blockH+yOffset)))
																	br (paintBlock dc p br (depth+1) (sibling-(workspaceWidth t)) t)
																	br (paintBlock dc p br (depth+1) (sibling+(workspaceWidth f)) f)
			
			addWorkspaceNode = undefined			--TODO
			loadWorkspace = undefined 				--TODO
			saveWorkspace = undefined				--TODO			