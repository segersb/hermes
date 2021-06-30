module Trade (
    Price(..),
    Trade(..)
) where

type Price = Double

data Trade = Trade {
    entry      :: Price,
    stopLoss   :: Price,
    takeProfit :: Price
} deriving Show
