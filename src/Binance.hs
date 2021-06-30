module Binance where

import Network.HTTP.Req
import Data.Proxy        (Proxy (..))
import Data.Aeson        (Result (..), ToJSON, decode, encode, fromJSON)

newtype BinanceTime = BinanceTime {
    serverTime :: Integer
} deriving Show

-- getBinanceTime :: IO Integer
-- getBinanceTime cid = runReq defaultHttpConfig $ do
--         req
--         GET
--         (https "api.binance.com" /: "api" /: "v3" /: "time")
--         NoReqBody
--         (Proxy :: Proxy (JsonResponse BinanceTime))
--         (port 80)

--         :: (MonadHttp m, HttpMethod method, HttpBody body,
--  HttpResponse response,
--  HttpBodyAllowed (AllowsBody method) (ProvidesBody body)) =>
-- method
-- -> Url scheme
-- -> body
-- -> Proxy response
-- -> Option scheme
-- -> m response

-- getStatus :: UUID -> IO (Either Text US.UserContractState)
-- getStatus cid = runReq defaultHttpConfig $ do
--     w <- req
--         GET
--         (http "127.0.0.1" /: "api"  /: "new" /: "contract" /: "instance" /: pack (show cid) /: "status")
--         NoReqBody
--         (Proxy :: Proxy (JsonResponse (ContractInstanceClientState UniswapContracts)))
--         (port 8080)
--     case fromJSON $ observableState $ cicCurrentState $ responseBody w of
--         Success (Last Nothing)  -> liftIO $ threadDelay 1_000_000 >> getStatus cid
--         Success (Last (Just e)) -> return e
--         _                       -> liftIO $ ioError $ userError "error decoding state"