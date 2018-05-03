module Domain.GPSSpec where

import Domain.GPS

import Test.Hspec
import TestTools

testGPS :: SpecWith ()
testGPS = 
    describe "Domain.GPS" $
        it "calculates entry distances" $
            let e1 = testEntry 1 1 100
                e2 = testEntry 2 2 150
            in distance e1 e2 `shouldBe` 157415.4549272101
