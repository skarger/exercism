module SumOfMultiples (sumOfMultiples) where
import Data.List (sort, nub)

sumOfMultiples :: (Integral a) => [a] -> a -> a
sumOfMultiples factors upperBound =
        sum . nub $ concat $ createMultiples factors upperBound

createMultiples :: (Integral a) => [a] -> a -> [[a]]
createMultiples factors upperBound = map (multiplesOf upperBound) factors

multiplesOf :: (Integral a) => a -> a -> [a]
multiplesOf upperBound factor = takeWhile (< upperBound) $ map (factor*) [1..]
