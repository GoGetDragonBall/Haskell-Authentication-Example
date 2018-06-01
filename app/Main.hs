{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import GHC.Generics
import Data.Aeson    
import Network.Wai.Handler.Warp    
import Servant

data LoginParams = LoginParams
    { id :: String
    , pw :: String
    } deriving (Generic)

instance FromJSON LoginParams

data LoginResponseBody = LoginResponseBody
    { field :: String } deriving (Generic)

instance ToJSON LoginResponseBody

type LoginAPI = "login" :> ReqBody '[JSON] LoginParams :> Post '[JSON] LoginResponseBody

server :: Server LoginAPI
server = _todo

api :: Proxy LoginAPI
api = Proxy

app :: Application
app = serve api server

main :: IO ()
main = run 8080 app
-- main = putStrLn "Hello World"