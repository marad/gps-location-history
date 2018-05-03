module Domain.Region where 

import Domain.Entry
import Domain.GPS
import Tools (groupTuples)

import Data.Text.Lazy
import Control.Applicative
import Geo.Types
import GHC.Generics

data Region = Region {
    name :: Text,
    regionLat :: Double,
    regionLon :: Double,
    radius :: Double
} deriving (Generic, Show, Eq, Ord)

instance GPSPoint Region where
    toPoint region =
        Point {
            pntLat = regionLat region,
            pntLon = regionLon region,
            pntEle = Nothing,
            pntTime = Nothing
        }


groupEntriesByRegion ::  [(Maybe Region, Entry)] -> [(Maybe Region, [Entry])]
groupEntriesByRegion = groupTuples

assignSingleRegion :: Region -> Entry -> Maybe Region
assignSingleRegion region entry =
    if distance region entry < radius region
        then Just region
        else Nothing


assignRegion :: [Region] -> Entry -> (Maybe Region, Entry)
assignRegion regions entry =
    (Prelude.foldl (\acc reg -> assignSingleRegion reg entry <|> acc) Nothing regions, entry)
