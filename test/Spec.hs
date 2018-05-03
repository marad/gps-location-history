import Domain.EntrySpec
import Domain.RegionSpec
import Domain.GPSSpec
import Domain.SpanSpec

import App.SpanCalculatorSpec

import Test.Hspec

main :: IO ()
main = hspec $ do
    testEntries
    testRegion
    testSpan
    testGPS
    testSpanCalculator