module Hamming (distance) where

distance :: (Eq a) => [a] -> [a] -> Maybe Integer
distance = currentPlusDistanceRest 0

currentPlusDistanceRest :: (Eq a) => Integer -> [a] -> [a] -> Maybe Integer
currentPlusDistanceRest n [] [] = Just n
currentPlusDistanceRest n [] _  = Nothing
currentPlusDistanceRest n _  [] = Nothing
currentPlusDistanceRest n (x:xs) (y:ys)
        | x /= y = currentPlusDistanceRest (n + 1) xs ys
        | x == y = currentPlusDistanceRest  n      xs ys
