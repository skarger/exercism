module Grains where

square :: Int -> Integer
square n = [2^k | k <- ([0..63] :: [Integer])] !! (n-1)

total :: Integer
total = 18446744073709551615
