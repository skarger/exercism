module Gigasecond where

import Data.Time

gigaSecond :: NominalDiffTime
gigaSecond = 1000000000 :: NominalDiffTime

fromDay :: UTCTime -> UTCTime
fromDay birthday = addUTCTime gigaSecond  birthday
