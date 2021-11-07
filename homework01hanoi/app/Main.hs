module Main where

import Lib (hanoi)

main :: IO ()
main = print (hanoi 3 "A" "B" "C")

