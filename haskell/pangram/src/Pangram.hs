module Pangram (isPangram) where

import Data.List
import Data.Maybe

isPangram :: String -> Bool
isPangram text = ['A'..'Z'] == (
        map head
        $ group . sort
        $ mapMaybe alphaToUpper text
                               )

alphaToUpper :: Char -> Maybe Char
alphaToUpper c
  | fromEnum c >= fromEnum 'a' && fromEnum c <= fromEnum 'z' =
          Just (toEnum $ fromEnum c - 32)
  | fromEnum c >= fromEnum 'A' && fromEnum c <= fromEnum 'Z' =
          Just c
  | otherwise =
          Nothing
