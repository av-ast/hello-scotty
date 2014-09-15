{-# LANGUAGE OverloadedStrings #-}

module Views.Layout (layout) where

import Assets.CSS       (layoutCss)
import Data.Monoid      (mempty)
import Data.Text.Lazy   (toStrict)
import Prelude          hiding (head)
import Text.Blaze.Html  (Html)
import Text.Blaze.Html5 (Html, body, docTypeHtml, head,
                               link, meta, script, style,
                               title, (!))
import Text.Blaze.Html5.Attributes (charset, content, href,
                               httpEquiv, media, name, rel, src)
import Views.Utils      (pet)
import Views.NavBar     (navBar)

layout :: Html -> Html -> Html
layout t b = docTypeHtml $ do
           pet "<!--[if lt IE 7]>      <html class='no-js lt-ie9 lt-ie8 lt-ie7'> <![endif]-->"
           pet "<!--[if IE 7]>         <html class='no-js lt-ie9 lt-ie8'/> <![endif]-->"
           pet "<!--[if IE 8]>         <html class='no-js lt-ie9'> <![endif]-->"
           pet "<!--[if gt IE 8]><!--> <html class='no-js'> <!--<![endif]-->"
           head $ do
             title t
             meta ! charset "utf-8"
             meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge,chrome=1"
             meta ! name "description" ! content "Inspire Text"
             meta ! name "viewport" ! content "width=device-width"
             link ! href "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" ! rel  "stylesheet" ! media "screen"
             style $ pet $ toStrict layoutCss
           body $ do
             navBar >> b
             script ! src "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" $ mempty
             script ! src "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" $ mempty
