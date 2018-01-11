{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens
import Data.Monoid
import Data.Aeson.Lens (_String, key)
import Network.Wreq

main :: IO ()
main = do
  r <- get "http://httpbin.org/get"
  print $ r ^. responseStatus . statusCode
