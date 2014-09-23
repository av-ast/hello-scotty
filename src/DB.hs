{-# LANGUAGE EmptyDataDecls    #-}
{-# LANGUAGE FlexibleContexts  #-}
{-# LANGUAGE GADTs             #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE TypeFamilies      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module DB where

import Data.Int
import Database.Persist
import Database.Persist.TH
import Database.Persist.Types
import Database.Persist.Sqlite

share [mkPersist sqlSettings, mkMigrate "migrateAll"] [persistLowerCase|
User
    firstName String
    lastName String
    email String
    password String
    UniqueEmail email
    deriving Show
Post
    title String
    body String
    userId UserId
    deriving Show
Comment
    body String
    postId PostId
    userId UserId
    deriving Show
|]

dbRun :: IO ()
dbRun = runSqlite ":memory:" $ do
  runMigration migrateAll

dbSeed :: IO ()
dbSeed = runSqlite ":memory:" $ do
  john <- insert $ User "John" "Doe" "john@test.com" "q123"
  jane <- insert $ User "Jane" "Doe" "jane@test.com" "q123"

  post1 <- insert $ Post "My fr1st p0st" "Post body 1" john
  post2 <- insert $ Post "One more for good measure" "Post body 2" john
  post3 <- insert $ Post "Jane's post" "Post body 3" jane

  insert $ Comment "Comment 1" post1 john
  insert $ Comment "Comment 2" post1 jane
  insert $ Comment "Comment 3" post3 john

  return ()
