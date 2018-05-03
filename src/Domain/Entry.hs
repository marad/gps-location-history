module Domain.Entry where

import Data.Text.Lazy
import Data.Time
import Domain.GPS

import Geo.Types
import Data.List (sortBy)
import Data.Ord (comparing)

data Entry = Entry {
    deviceName :: Text,
    accuracy :: Double,
    entryLat :: Double,
    entryLon :: Double,
    epochTime :: Int,
    time :: UTCTime
} deriving (Show, Eq, Ord)

instance GPSPoint Entry where
    toPoint entry =
        Point {
            pntLat = entryLat entry,
            pntLon = entryLon entry,
            pntEle = Nothing,
            pntTime = Just $ time entry
        }

sortEntriesByTime :: [Entry] -> [Entry]
sortEntriesByTime = sortBy (comparing time)
