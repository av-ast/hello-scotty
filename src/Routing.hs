{-# LANGUAGE OverloadedStrings #-}
module Routing (handleRequest) where

import Web.Scotty (ScottyM, get,
                   html, redirect, notFound, text, file, setHeader)
import Views.Home (homeView)
import Views.Contacts (contactsView)

handleRequest :: ScottyM ()
handleRequest = do
  get "/" homeView
  get "/contacts" contactsView
  get "/dl" $ do
    setHeader "Content-Type" "application/octet-stream"
    setHeader "Content-Disposition" "attachment"
    file "src/Main.hs"
  get "/google" $ do
    redirect "http://www.google.com"
  notFound $ do
    text "404 not found"
