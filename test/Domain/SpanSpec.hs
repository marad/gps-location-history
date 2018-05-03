module Domain.SpanSpec where

import Domain.Span
import Tools (readUtcTime)

import Test.Hspec

testSpan :: SpecWith ()
testSpan =
    describe "Domain.Span" $
        describe "spanTime" $
            it "calculates the span time difference in seconds" $
                let entryTime = readUtcTime 100
                    leaveTime = readUtcTime 200
                    testedSpan = Span Nothing [] entryTime leaveTime
                in spanTime testedSpan `shouldBe` 100