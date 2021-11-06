import Control.Exception (evaluate)
import Test.Hspec
import Test.QuickCheck

import Lib

main :: IO ()
main = hspec $ do
  describe "list digits" $ do
    it "toDigits should return a list of the digits" $ do
      toDigits 1234 `shouldBe` [1,2,3,4]
    it "toDigits 0 should return an empty list" $ do
      toDigits 0 `shouldBe` []
    it "toDigits negative number should return an empty list" $ do
      toDigits (-14) `shouldBe` []
  describe "list digits reversed" $ do
    it "toDigitsRev should return a list of the digits reversed" $ do
      toDigitsRev 1234 `shouldBe` [4, 3, 2, 1]
    it "toDigitsRev 0 should return an empty list" $ do
      toDigitsRev 0 `shouldBe` []
    it "toDigitsRev negative number should return an empty list" $ do
      toDigitsRev (-14) `shouldBe` []
