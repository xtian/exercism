module SpaceAge exposing (..)


type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune


ageOn : Planet -> Int -> Float
ageOn planet seconds =
    toFloat seconds / orbitalPeriod planet


orbitalPeriod : Planet -> Float
orbitalPeriod planet =
    case planet of
        Mercury ->
            0.2408467 * orbitalPeriod Earth

        Earth ->
            31557600

        Venus ->
            0.61519726 * orbitalPeriod Earth

        Mars ->
            1.8808158 * orbitalPeriod Earth

        Jupiter ->
            11.862615 * orbitalPeriod Earth

        Saturn ->
            29.447498 * orbitalPeriod Earth

        Uranus ->
            84.016846 * orbitalPeriod Earth

        Neptune ->
            164.79132 * orbitalPeriod Earth
