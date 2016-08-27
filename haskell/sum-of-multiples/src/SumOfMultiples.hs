module SumOfMultiples (sumOfMultiples) where
import Data.List (sort, nub)

sumOfMultiples :: (Integral a) => [a] -> a -> a
sumOfMultiples numberSet upperBound =
        sum . nub $ concat $ createMultiples numberSet upperBound

createMultiples :: (Integral a) => [a] -> a -> [[a]]
createMultiples factors upperBound = map (multiplesOf upperBound) factors

multiplesOf :: (Integral a) => a -> a -> [a]
multiplesOf upperBound factor = takeWhile (< upperBound) $ map (factor*) [1..]

