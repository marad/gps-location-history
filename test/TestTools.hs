module TestTools where

import Domain.Entry
import Tools

testEntry :: Double -> Double -> Int -> Entry
testEntry lat lon time  = Entry "Nexus6P" 10 lat lon time (readUtcTime time)