module Domain.EntrySpec where

import Domain.Entry

import Test.Hspec
import TestTools


testEntries :: SpecWith ()
testEntries = 
    describe "Domain.Entry" $
        it "sorts entry lists by creation time" $
            let input = [ testEntry 1 1 100
                        , testEntry 1 1 50
                        , testEntry 1 1 150
                        , testEntry 1 1 20
                        ]
                expected = [ testEntry 1 1 20
                            , testEntry 1 1 50
                            , testEntry 1 1 100
                            , testEntry 1 1 150]
            in sortEntriesByTime input `shouldBe` expected
