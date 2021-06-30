{-# LANGUAGE OverloadedStrings #-}

module Main where
import GHC.Float
import Control.Monad
import Control.Monad.IO.Class
import Asset
import Trade
import Trend
import Binance

import Network.HTTP.Req
import Data.Proxy
import Data.Aeson

main :: IO ()
main = do
    -- let assetPair = AssetPair "ADA" "EUR"
    -- let trade = Trade (float2Double 100.00) (float2Double 95.00) (float2Double 115.00)
    -- print assetPair
    let point1 = Point 0  (float2Double 100.00)
    let point2 = Point 60 (float2Double 110.00)
    let trendLine = TrendLine point1 point2
    let slope = trendLineSlope trendLine
    print slope
    print $ slope * 60
    print $ trendLinePriceAtTime trendLine 120

    runReq defaultHttpConfig $ do
        res <- req
                GET
                (https "api.binance.com" /: "api" /: "v3" /: "time")
                NoReqBody
                jsonResponse
                mempty 
                
        liftIO $ print (responseBody res :: Value)

    -- x <- runReq defaultHttpConfig $ do



    putStr "done"
