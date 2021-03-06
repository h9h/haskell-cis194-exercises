module Lib
    ( someFunc, toDigits, toDigitsRev, doubleEveryOther, sumDigits, validate
    ) where

someFunc :: IO ()
someFunc = do
    print $ "number " ++ show 1234
    print (toDigits 1234)
    print (toDigitsRev 1234)

-- Exercise 1
toDigits :: Integer -> [Integer]
toDigits number
    | number <= 0 = []
    | otherwise = toDigits (number `div` 10) ++ [number `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev number = reverse $ toDigits number

-- Exercise 2
{-
    zipWith generalises zip by zipping with the function given as the first argument, instead of a tupling function. 

    ```
    zipWith (,) xs ys == zip xs ys
    zipWith f [x1,x2,x3..] [y1,y2,y3..] == [f x1 y1, f x2 y2, f x3 y3..]
    ```

    cycle ties a finite list into a circular one, or equivalently, the infinite repetition of the original list.

    So:
        - cycle [id, (* 2)] creates an infinite list alternating the functions  (*2) and identity
        - ($) is function application, so zipWith ($) has type
            zipWith ($) :: [x -> y] -> [x] -> [y]
          It expects a list of function and a list and return a new list with the function element applied to the list element
        - zipWith ($) [id, (*2), id, (*2), ...] [a,b,c,d...] returns
            [$ id a, $ (*2) b, $ id c, ...]
    
    Taking every other digit from the right would work differently for lists with even or odd number of elements, hence work on reversed list and return the back-reversed result
-}
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith ($) (cycle [id, (*2)]) . reverse

-- Exercise 3
{-
    Idea here is to just split all integers in the list once again into digits,
    hence we map our toDigits funtion over the list.
    Since we then have a list of lists we need to flatten this.
    concatMap unifies these two steps.
-}
sumDigits :: [Integer] -> Integer
sumDigits = sum . concatMap toDigits

-- Exercise 4
validate :: Integer -> Bool 
validate number
    | number <= 0 = False
    | otherwise = (sumDigits . doubleEveryOther $ toDigits number) `mod` 10 == 0
