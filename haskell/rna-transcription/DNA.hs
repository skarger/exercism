module DNA where

transformNucleotide :: Char -> Char
transformNucleotide 'C' = 'G'
transformNucleotide 'G' = 'C'
transformNucleotide 'A' = 'U'
transformNucleotide 'T' = 'A'
transformNucleotide  _  = ' '

toRNA :: String -> String
toRNA dnaStrand = map transformNucleotide dnaStrand
