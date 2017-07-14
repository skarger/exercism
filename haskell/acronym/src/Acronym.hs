module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate xs = map toUpper $ concatMap initial $ words xs

initial :: String -> [Char]
initial xs
  | xs == [] = []
  | (not . isAlpha) $ head xs = initial (tail xs)
  | isOneWord isUpper xs = [head xs]
  | isOneWord isLower xs = [head xs]
  | otherwise = head xs : initial (dropWhile (skippable isLower) $ tail xs)
  where skippable isCase c = isCase c || (not . isAlpha) c && '-' /= c
        isOneWord isCase xs = and [skippable isCase x | x <- xs]
