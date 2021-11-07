module Lib
    ( hanoi
    ) where

type Peg = String 
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi count from to spare = 
    hanoi (count - 1) from spare to
    ++ [(from, to)] 
    ++ hanoi (count - 1) spare to from
