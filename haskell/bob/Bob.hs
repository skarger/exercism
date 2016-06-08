module Bob where

import Data.Char(isLower, isAlpha, isSpace)

silence :: String -> Bool
silence comment = (length comment == 0) || all isSpace comment

yell :: String -> Bool
yell comment = any isAlpha comment && (not $ any isLower comment)

question :: String -> Bool
question comment = last comment == '?'

responseFor :: String -> String
responseFor comment
  | silence comment == True = "Fine. Be that way!"
  | yell comment = "Whoa, chill out!"
  | question comment = "Sure."
  | otherwise = "Whatever."
