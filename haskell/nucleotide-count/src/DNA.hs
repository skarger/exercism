module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

nucleotides :: [Char]
nucleotides = ['A', 'C', 'G', 'T']

count :: Char -> String -> Either String Int
count c "" = Right 0
count c (n:ns)
  | notElem c nucleotides = Left "Invalid nucleotide given to count"
  | notElem n nucleotides = Left "Invalid nucleotide found in strand"
  | otherwise = let incrementBy = if c == n then 1 else 0
                 in fmap (+incrementBy) $ count c ns

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts s = 
        fmap (fromList . zip nucleotides) (mapM (flip count s) nucleotides)
