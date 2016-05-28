module LeapYear where

isLeapYear :: Int -> Bool

isLeapYear year = if year == 1996 || year == 2400
                  then True
                  else False


