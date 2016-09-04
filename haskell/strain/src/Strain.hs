module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard predicate = keep (not . predicate)

keep :: (a -> Bool) -> [a] -> [a]
keep predicate = foldr (\x acc -> if predicate x then x:acc else acc) []
