{-# LANGUAGE OverloadedStrings #-}

module Views.Home (homeView) where

import Prelude          hiding (div, id)
import Text.Blaze.Html5 (a, div, h1, p, (!))
import Text.Blaze.Html5.Attributes (class_, href, id)
import Web.Scotty       (ActionM)

import Views.Utils      (blaze)
import Views.Layout     (layout)

homeView :: ActionM ()
homeView = blaze $ layout "home" $ do
             div ! class_ "container" $ do
               div ! class_ "jumbotron" $ do
                 h1 "qwqwqw Hello, Scotty!"
                 p "Welcome to my 1st Haskell pet project based on Scotty web-framework, equipped with Blaze templating, Twitter Bootstrap 3.0 and HTML5 boilerplate"
                 p $ do a ! class_ "btn btn-lg btn-primary" ! id "fb" ! href "#navbar" $ "Facebook"
                        a ! class_ "btn btn-lg btn-danger" ! id "gmail" ! href "#navbar" $ "Gmail"
