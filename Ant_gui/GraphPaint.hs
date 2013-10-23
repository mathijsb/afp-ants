module GraphPaint where

import Graphics.UI.WXCore
import Graphics.UI.WX
import Control.Monad

---globale variabelen
nodeW = 100
nodeH = 50
---------


addNodeToPanel pnl pos = do
					p1 <- panel pnl [outerSize := Size nodeW nodeH , position := pos, bgcolor := (rgb 202 225 255)]
					buttonAddnode <- smallButton p1 [text:= "+", position:= Point 0 0]
					buttonRemove <- smallButton p1 [text:= "x", position:= Point 0 0]
					set p1 [layout:= column 1 [ minsize (sz nodeW 25) (row 1 [ (label "NodeName"),halignRight (widget buttonRemove)]), widget buttonAddnode]]
					set p1 [on drag := doDrag pnl p1]
					return p1

doDrag parent pnl pt = do
							pos <- liftM (pointMove (vecFromPoint pt)) (get pnl position)
							set pnl [position := pos]