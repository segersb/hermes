module Trend (
    TrendLine(..),
    Point(..),
    trendLineSlope,
    trendLinePriceAtTime
) where

data TrendLine = TrendLine {
    trendLinePoint1 :: Point,
    trendLinePoint2 :: Point
}

data Point = Point {
    pointTime  :: Integer,
    pointPrice :: Double
}

trendLineSlope :: TrendLine -> Double
trendLineSlope trendLine =
    let rise = pointPrice (trendLinePoint2 trendLine) - pointPrice (trendLinePoint1 trendLine)
        run  = pointTime (trendLinePoint2 trendLine) - pointTime (trendLinePoint1 trendLine)
    in  rise / fromIntegral run

trendLinePriceAtTime :: TrendLine -> Integer -> Double
trendLinePriceAtTime trendLine time =
    let startPrice     = pointPrice $ trendLinePoint1 trendLine
        timeDifference = fromIntegral $ time - pointTime (trendLinePoint1 trendLine)
    in  startPrice + (timeDifference * trendLineSlope trendLine)