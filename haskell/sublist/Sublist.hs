module Sublist where

import Data.List(isInfixOf)

data Sublist = Equal | Unequal | Sublist | Superlist
  deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist k l
  | isInfixOf k l && isInfixOf l k = Equal
  | isInfixOf k l = Sublist
  | isInfixOf l k = Superlist
  | otherwise = Unequal
