module ScrabbleScore exposing (scoreWord)

import Dict exposing (Dict)


scoreWord : String -> Int
scoreWord =
    String.toUpper
        >> String.toList
        >> List.filterMap (flip Dict.get scores)
        >> List.sum


scores : Dict Char Int
scores =
    let
        assignScores score letters dict =
            String.foldl (flip Dict.insert score) dict letters
    in
        Dict.empty
            |> assignScores 1 "AEIOULNRST"
            |> assignScores 2 "DG"
            |> assignScores 3 "BCMP"
            |> assignScores 4 "FHVWY"
            |> assignScores 5 "K"
            |> assignScores 8 "JX"
            |> assignScores 10 "QZ"
