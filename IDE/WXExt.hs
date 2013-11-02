{-# LANGUAGE ForeignFunctionInterface #-}

-- | Small extension to the wxhaskell library that allows usage of some newer
-- features in the STC part of WX.
--
-- Bert Massop, 2013
--

module IDE.WXExt (
    wxSTC_MARGIN_TEXT,
    styledTextCtrlMarginSetText
) where

import Foreign.C.Types(CInt(..), CWchar(..), CChar(..), CDouble(..))
import Graphics.UI.WXCore.WxcTypes
import Graphics.UI.WXCore.WxcClassTypes

wxSTC_MARGIN_TEXT :: Int
wxSTC_MARGIN_TEXT = 4

-- | usage: (@styledTextCtrlMarginSetText obj line text@).
styledTextCtrlMarginSetText :: StyledTextCtrl  a -> Int -> String ->  IO ()
styledTextCtrlMarginSetText _obj line text 
  = withObjectRef "styledTextCtrlMarginSetText" _obj $ \cobj__obj -> 
    withStringPtr text $ \cobj_text -> 
    wxStyledTextCtrl_MarginSetText cobj__obj (toCInt line) cobj_text  
foreign import ccall "wxStyledTextCtrl_MarginSetText" wxStyledTextCtrl_MarginSetText :: Ptr (TStyledTextCtrl a) -> CInt -> Ptr (TWxString b) -> IO ()


