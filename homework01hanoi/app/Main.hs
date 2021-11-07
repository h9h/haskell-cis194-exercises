module Main where

import Lib

main :: IO ()
main = print (hanoi 2 "A" "B" "C")

