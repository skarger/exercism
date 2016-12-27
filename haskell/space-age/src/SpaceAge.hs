module SpaceAge (Planet(..), ageOn) where

data Planet = Earth
            | Mercury
            | Venus
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

earthYearRatio :: Planet -> Float
earthYearRatio planet = case planet of Earth -> 1.0
                                       Mercury -> 0.2408467
                                       Venus -> 0.61519726
                                       Mars -> 1.8808158
                                       Jupiter -> 11.862615
                                       Saturn -> 29.447498
                                       Uranus -> 84.016846
                                       Neptune -> 164.79132

daysInYear :: Planet -> Float
daysInYear planet = earthYearRatio planet * earthDaysInYear
        where earthDaysInYear = 365.25

secondsInYear :: Planet -> Float
secondsInYear planet = daysInYear planet * hours * minutes * seconds
        where hours = 24
              minutes = 60
              seconds = 60

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / secondsInYear planet
