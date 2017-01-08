module DNA (count, nucleotideCounts) where

import Data.Map (Map)
import Data.Either (isRight)

count :: Char -> String -> Either String Int
count c "" = Right 0
count c (n:ns)
        | invalidNucleotide c = Left "Invalid nucleotide given to count"
        | invalidNucleotide n = Left "Invalid nucleotide found in strand"
        | c == n = fmap (+1) $ count c ns
        | c /= n = count c ns

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts s = Left ""

invalidNucleotide :: Char -> Bool
invalidNucleotide c = not $ any (c ==) "ATCG"
