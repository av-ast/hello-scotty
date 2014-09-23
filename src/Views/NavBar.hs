{-# LANGUAGE OverloadedStrings #-}

module Views.NavBar (navBar) where

import Prelude          hiding (div)
import Text.Blaze.Html  (Html)
import Text.Blaze.Html5 (Html, a, button, dataAttribute, div, li, ul, (!))
import Text.Blaze.Html5.Attributes (charset, class_, content, href, type_)

navBar :: Html
navBar = div ! class_ "navbar navbar-default navbar-static-top" $ div ! class_ "container" $ do
           div ! class_ "navbar-header" $ do
             button ! type_ "button"
                    ! class_ "navbar-toggle" ! dataAttribute "toggle" "collapse" ! dataAttribute "target" ".navbar-collapse" $ do
               a ! class_ "navbar-brand" ! href "#" $ "λ"
           div ! class_ "navbar-collapse collapse" $ ul ! class_ "nav navbar-nav" $ do
             li ! class_ "active" $ a ! href "/" $ "Home"
             li $ a ! href "/about" $ "About"
             li $ a ! href "/contacts" $ "Contacts"
