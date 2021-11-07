import Control.Exception (evaluate)
import Lib
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
  describe "Tower of Hanoi" $ do
    it "should solve 2 disks" $ do
      hanoi 2 "A" "B" "C" `shouldBe` [("A", "C"), ("A", "B"), ("C", "B")]
    it "15 disks should be done in 2^15 - 1 moves" $ do
      length (hanoi 15 "A" "B" "C") `shouldBe` 32767
    it "15 disks should be done in 129 moves if two spare pegs" $ do
      length (hanoi4 15 "A" "B" "C" "D") `shouldBe` 129
