import Control.Exception (evaluate)
import Lib
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Tower of Hanoi" $ do
    it "should solve 2 disks" $ do
      hanoi 2 "A" "B" "C" `shouldBe` [("A", "C"), ("A", "B"), ("C", "B")]
