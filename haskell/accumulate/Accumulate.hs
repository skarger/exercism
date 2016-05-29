module Accumulate where

accumulate :: (a -> b) -> [a] -> [b]
accumulate _  []         = []
accumulate fn (el:elems) = fn el : accumulate fn elems
