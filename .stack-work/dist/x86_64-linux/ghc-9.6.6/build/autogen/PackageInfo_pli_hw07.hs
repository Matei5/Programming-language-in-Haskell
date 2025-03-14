{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module PackageInfo_pli_hw07 (
    name,
    version,
    synopsis,
    copyright,
    homepage,
  ) where

import Data.Version (Version(..))
import Prelude

name :: String
name = "pli_hw07"
version :: Version
version = Version [0,1,0,0] []

synopsis :: String
synopsis = "Homework 07 for PLI."
copyright :: String
copyright = ""
homepage :: String
homepage = ""
