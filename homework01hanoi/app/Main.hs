module Main where

import Lib (hanoi4)

main :: IO ()
main = print (hanoi4 6 "A" "B" "C" "D")

