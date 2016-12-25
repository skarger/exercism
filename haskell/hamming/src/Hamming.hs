module Hamming (distance) where

distance :: (Eq a) => [a] -> [a] -> Maybe Integer
distance x y = if length x /= length y
        then Nothing
        else Just (sum $ map (\b -> if b then 1 else 0) $ zipWith (/=) x y)
