module RunLength (decode, encode) where

import Data.List (group, groupBy)
import Data.Char (isDigit)

decode :: String -> String
decode "" = ""
decode str@(c:cs)
  | isDigit c = replicate count character ++ decode rest
  | otherwise = c : decode cs
  where (countString, character:rest) = span isDigit str
        count = read countString :: Int

encode :: String -> String
encode str = concatMap encodeRun . group $ str
        where encodeRun run@(c:cs) = runLength run ++ [c]
              runLength run
                | length run > 1 = show $ length run
                | otherwise = ""
