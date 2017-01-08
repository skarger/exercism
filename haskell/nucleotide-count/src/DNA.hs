module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

count :: Char -> String -> Either String Int
count c "" = Right 0
count c (n:ns)
        | invalidNucleotide c = Left "Invalid nucleotide given to count"
        | invalidNucleotide n = Left "Invalid nucleotide found in strand"
        | c == n = fmap (+1) $ count c ns
        | c /= n = count c ns

invalidNucleotide :: Char -> Bool
invalidNucleotide c = not $ any (c ==) "ATCG"

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts s = 
        case (count 'A' s, count 'C' s, count 'G' s, count 'T' s) of
              (Right a, Right c, Right g, Right t) ->
                      Right $ fromList [('A', a), ('C', c), ('G', g), ('T', t)]
              otherwise -> Left "Invalid nucleotide found in strand"
