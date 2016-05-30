module Grains where

square :: Int -> Integer
square n
  | n < 1 || n > 64 = error "Invalid chess board square.\
                            \ Must be in [1..64]"
  | otherwise = 2^(n-1)

total :: Integer
total = 18446744073709551615
