{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_pli_hw07 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/bin"
libdir     = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/lib/x86_64-linux-ghc-9.6.6/pli-hw07-0.1.0.0-DdXLQDOtYA79AZOUYf7ysw"
dynlibdir  = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/lib/x86_64-linux-ghc-9.6.6"
datadir    = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/share/x86_64-linux-ghc-9.6.6/pli-hw07-0.1.0.0"
libexecdir = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/libexec/x86_64-linux-ghc-9.6.6/pli-hw07-0.1.0.0"
sysconfdir = "/home/matei/Documents/2. Projects/final-project-records-Matei5/.stack-work/install/x86_64-linux/16998512afea12cb5792087200c5194fc6f831fba7617e663a9925af6df982e2/9.6.6/etc"

getBinDir     = catchIO (getEnv "pli_hw07_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "pli_hw07_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "pli_hw07_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "pli_hw07_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pli_hw07_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pli_hw07_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
