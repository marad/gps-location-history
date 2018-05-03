module Domain.Span where

import Domain.Entry
import Domain.Region

import Data.Time
import Data.Text.Lazy

data Span = Span {
    region :: Maybe Region,
    entries :: [Entry],
    enterTime :: UTCTime,
    leaveTime :: UTCTime
} deriving (Eq, Ord)

regionNameOrUnknown :: Span -> Text
regionNameOrUnknown (Span (Just r) _ _ _)  = name r
regionNameOrUnknown _ = "unknown"

spanTime :: Span -> NominalDiffTime
spanTime givenSpan = diffUTCTime (leaveTime givenSpan) (enterTime givenSpan)

instance Show Span where
    show s@(Span _ _ enter leave) =
        show (regionNameOrUnknown s) ++ "\n" ++ 
        "\tEnter: " ++ show enter ++ "\n\tLeave: " ++ show leave ++ "\n" ++ 
        "\tTime spent: " ++ show (spanTime s) ++
        "\tHours: " ++ show (let hours = toRational (spanTime s / 3600) in floor hours :: Int) ++ "h"
