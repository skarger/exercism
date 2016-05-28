module Accumulate where

myMap :: (a->b) -> [a] -> [b]
myMap _ []       = []
myMap f (x:xs)   = f x : myMap f xs

accumulate :: (a -> b) -> [a] -> [b]
accumulate fn elems = myMap fn elems 
