module Main where

import Control.Applicative                  ((<$>))
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Network.Wai.Middleware.Static        (addBase, noDots, staticPolicy, (>->))
import Web.Scotty                           (middleware, scotty)
import System.Environment                   (getEnv)
import Routing                              (handleRequest)

main :: IO ()
main = do
  port <- read <$> getEnv "PORT"
  scotty port $ do
    middleware $ staticPolicy (noDots >-> addBase "images") -- for favicon.ico
    middleware logStdoutDev
    handleRequest
