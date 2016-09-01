module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard predicate (x:xs)
        | predicate x = discard predicate xs
        | otherwise = x:discard predicate xs

keep :: (a -> Bool) -> [a] -> [a]
keep predicate collection = discard (not . predicate) collection
