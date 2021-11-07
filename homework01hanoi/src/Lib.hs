module Lib
    ( hanoi, hanoi4
    ) where

import Data.List
import Data.Ord

-- Exercise 5
type Peg = String 
type Move = (Peg, Peg)

{-
    Algorithm translates directly into haskell:
        - move n − 1 discs from a to c using b as temporary storage
        - move disc from a to b
        - move n − 1 discs from c to b using a as temporary storage
-}
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []
hanoi count from to spare = 
    hanoi (count - 1) from spare to
    ++ [(from, to)] 
    ++ hanoi (count - 1) spare to from

-- Exercise 6
{-
    What if we have two spares?
        - we transfer n-k disks into spare no. 2, optionally using both spares
            - we have solution for n-k = 1, so solution exists for some k
        - then we solve with 3-peg hanoi the transfer for k disks using spare no. 1
        - at last we tranfer the n-k disks from spare no.2 into target
        - we try that for k = 1..(n-1) and take the smallest solution
-}
hanoi4 :: Integer -> Peg -> Peg -> Peg -> Peg -> [Move]
hanoi4 0 _ _ _ _ = []
hanoi4 1 from to _ _ = [(from, to)]
hanoi4 n from to s1 s2 = 
    shortest [   hanoi4 (n - k) from s2 s1 to 
              ++ hanoi  k       from to s1 
              ++ hanoi4 (n - k) s2 to from s1 
            | k <- [1 .. (n - 1)]]

shortest :: [[a]] -> [a]
shortest [] = []
shortest ls = minimumBy (comparing length) ls
