module Sublist where

import Data.List(isInfixOf)

data Sublist = Equal | Unequal | Sublist | Superlist
  deriving (Show, Eq)

sublist :: Eq a => [a] -> [a] -> Sublist
sublist k l = if isInfixOf k l && isInfixOf l k then Equal
              else if isInfixOf k l then Sublist
              else if isInfixOf l k then Superlist
              else Unequal
