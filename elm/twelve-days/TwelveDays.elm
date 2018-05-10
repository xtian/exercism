module TwelveDays exposing (recite)

import Array exposing (Array)


recite : Int -> Int -> List String
recite start stop =
    let
        verse n =
            "On the "
                ++ ordinal n
                ++ " day of Christmas my true love gave to me, "
                ++ gifts n
    in
    List.map verse (List.range start stop)


gifts : Int -> String
gifts n =
    let
        addConjunction list =
            case list of
                a :: b :: rest ->
                    ("and " ++ a) :: b :: rest

                _ ->
                    list
    in
    [ "a Partridge in a Pear Tree."
    , "two Turtle Doves"
    , "three French Hens"
    , "four Calling Birds"
    , "five Gold Rings"
    , "six Geese-a-Laying"
    , "seven Swans-a-Swimming"
    , "eight Maids-a-Milking"
    , "nine Ladies Dancing"
    , "ten Lords-a-Leaping"
    , "eleven Pipers Piping"
    , "twelve Drummers Drumming"
    ]
        |> List.take n
        |> addConjunction
        |> List.reverse
        |> String.join ", "


ordinal : Int -> String
ordinal n =
    [ "first"
    , "second"
    , "third"
    , "fourth"
    , "fifth"
    , "sixth"
    , "seventh"
    , "eighth"
    , "ninth"
    , "tenth"
    , "eleventh"
    , "twelfth"
    ]
        |> Array.fromList
        |> Array.get (n - 1)
        |> Maybe.withDefault ""
