module RunLength (decode, encode) where

import Data.List (group, groupBy)
import Data.Char (isDigit)

decode :: String -> String
decode s = concatMap decompress $
                pairs . normalizeEncoded $
                groupBy groupCharacters s

encode :: String -> String
encode s = concat $ zipWith (++) counts characters
        where counts     = map characterCount $ group s
              characters = map ((:[]) . head) $ group s


decompress :: (String, String) -> String
decompress (countString, characterString) = replicate count character
        where count = read countString :: Int
              character = head characterString

pairs :: [String] -> [(String, String)]
pairs [] = []
pairs (x:y:zs) = (x, y):pairs zs

normalizeEncoded :: [String] -> [String]
normalizeEncoded [] = []
normalizeEncoded [s] = ["1", s]
normalizeEncoded (x:y:zs)
  | isDigit (head x) = [x, y] ++ normalizeEncoded zs
  | otherwise = ["1", x] ++ normalizeEncoded (y:zs)

groupCharacters :: Char -> Char -> Bool
groupCharacters c d = isDigit c && isDigit d

characterCount :: String -> String
characterCount s
  | length s == 1 = ""
  | otherwise = show $ length s
