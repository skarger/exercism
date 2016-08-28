module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard predicate collection = [x | x <- collection, not $ predicate x]

keep :: (a -> Bool) -> [a] -> [a]
keep predicate collection = [x | x <- collection, predicate x]
