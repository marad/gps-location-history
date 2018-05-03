module App.SpanCalculatorSpec where

import Domain.Entry
import Domain.Span
import App.SpanCalculator

import Test.Hspec
import TestTools
import TestRegions

testSpanCalculator :: SpecWith ()
testSpanCalculator =
    describe "App.SpanCalculator" $ 
        describe "calcSpans" $ do
            it "calculates spans from entries in unknown regions ignoring order" $
                let e1 = testEntry 1 1 100
                    e2 = testEntry 2 2 200
                    e3 = testEntry 3 3 300
                in calculateSpans regions [e1, e3, e2] `shouldBe` [Span {
                    region = Nothing,
                    entries = [e1, e2, e3],
                    enterTime = time e1,
                    leaveTime = time e3
                }]
            it "calculates spans with entries " $
                let notInRegion = testEntry 18.590383 53.051987 100
                    inIntermarche = testEntry 18.598546 53.041952 105
                    outAgain =  testEntry 18.590383 53.051987 110
                    farAway =  testEntry 18.564734 53.054949 115
                in calculateSpans regions [notInRegion, inIntermarche, outAgain, farAway] `shouldBe` [
                    Span {
                        region = Nothing,
                        entries = [notInRegion],
                        enterTime = time notInRegion,
                        leaveTime = time notInRegion
                    },
                    Span {
                        region = Just intermarche,
                        entries = [inIntermarche],
                        enterTime = time inIntermarche,
                        leaveTime = time inIntermarche
                    },
                    Span {
                        region = Nothing,
                        entries = [outAgain, farAway],
                        enterTime = time outAgain,
                        leaveTime = time farAway
                    }
                ]
