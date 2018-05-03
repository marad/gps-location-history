module Domain.RegionSpec where

import Domain.Region

import Test.Hspec
import TestTools
import TestRegions

testRegion :: SpecWith ()
testRegion =
    describe "Domain.Region" $ do
        it "does not assign anything when entry out of all regions" $
            let e = testEntry 18.590383 53.051987 100
            in assignRegion regions e `shouldBe` (Nothing, e)
        it "assigns region properly" $
            let e = testEntry 18.598546 53.041952 100
            in assignRegion regions e `shouldBe` (Just intermarche, e)