module Lib
    ( someFunc, toDigits, toDigitsRev    
    ) where

someFunc :: IO ()
someFunc = do
    print $ "number " ++ show 1234
    print (toDigits 1234)
    print (toDigitsRev 1234)

toDigits :: Integer -> [Integer]
toDigits number
    | number <= 0 = []
    | otherwise = toDigits (number `div` 10) ++ [number `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev number = reverse $ toDigits number
