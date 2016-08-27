module SumOfMultiples (sumOfMultiples) where
import Data.List (sort, nub)

sumOfMultiples :: (Integral a) => [a] -> a -> a
sumOfMultiples factors upperBound =
        sum . nub $ concat $ createMultiples factors upperBound

createMultiples :: (Integral a) => [a] -> a -> [[a]]
createMultiples factors upperBound = map
        ((\ub f -> takeWhile (< ub) $ map (f*) [1..]) upperBound)
        factors
