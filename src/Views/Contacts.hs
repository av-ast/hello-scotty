{-# LANGUAGE OverloadedStrings #-}

module Views.Contacts (contactsView) where

import Prelude          hiding (div, id)
import Text.Blaze.Html5 (a, div, p, ul, li, (!))
import Text.Blaze.Html5.Attributes (class_, href, id)
import Web.Scotty       (ActionM)

import Views.Utils      (blaze)
import Views.Layout     (layout)

contactsView :: ActionM ()
contactsView = blaze $ layout "contacts" $ do
  div ! class_ "container" $ do
    p "A list of my contacts:"
    ul $ do
      li $ do a ! class_ "contacts-link" ! href "mailto:av.astafyev@gmail.com" $ "av.astafyev@gmail.com"
      li $ do a ! class_ "contacts-link" ! href "https://twitter.com/av_ast" $ "https://twitter.com/av_ast"
      li $ do a ! class_ "contacts-link" ! href "https://www.facebook.com/av.astafyev" $ "https://www.facebook.com/av.astafyev"
