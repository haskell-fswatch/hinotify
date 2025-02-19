module Main where

import Control.Exception (bracket)
import Control.Monad (void)
import qualified Data.ByteString as BS
import GHC.Foreign (withCString)
import GHC.IO.Encoding (getFileSystemEncoding)
import System.Directory (getHomeDirectory)
import System.INotify (EventVariety(..), initINotify, addWatch, removeWatch)


main :: IO ()
main = do
    inotify <- initINotify
    print inotify

    home <- getHomeDirectory >>= toRawFilePath
    bracket (addWatch inotify [Open, Close, Access, Modify, Move] home print) removeWatch $ \wd -> do
      print wd

      putStrLn "Listening to your home directory. Hit enter to terminate."
      void getLine


toRawFilePath :: FilePath -> IO BS.ByteString
toRawFilePath fp = do
  enc <- getFileSystemEncoding
  withCString enc fp BS.packCString
