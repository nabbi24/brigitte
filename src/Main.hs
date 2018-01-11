{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid

import Web.Scotty
import Network.HTTP.Types

main :: IO ()
main = do
  scotty 8080 $ do
    get "/" $ do
      text "Hello, world."

    get "/hello/:name" $ do
      name <- param "name"
      text $ "Hello, " <> name <> "."

    get "/redirect/to/root" $ do
      status status302
      setHeader "X-Foo-Bar" "bazqux"
      redirect "/"

