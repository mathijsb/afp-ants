module Blocks where

data WorkspaceTree =  IfNode WorkspaceTree WorkspaceTree
					| StatementNode WorkspaceTree
					| Empty
					
workspaceWidth :: WorkspaceTree -> Int
workspaceWidth Empty = 1
workspaceWidth (StatementNode s) = workspaceWidth s
workspaceWidth (IfNode l r) = workspaceWidth l + workspaceWidth r