module Tools (
    readUtcTime,
    groupTuples
) where

import Data.Time
import Data.Function (on)
import Data.List (groupBy)

readUtcTime :: Int -> UTCTime
readUtcTime seconds = parseTimeOrError True defaultTimeLocale "%s" (show seconds)

groupTuples :: (Ord a) => [(a, b)] -> [(a, [b])]
groupTuples = map (\l -> (fst . head $ l, map snd l)) . Data.List.groupBy ((==) `on` fst)