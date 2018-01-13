module Hamming exposing (..)


distance : String -> String -> Maybe Int
distance a b =
    if String.length a /= String.length b then
        Nothing
    else
        List.map2 (/=)
            (String.toList a)
            (String.toList b)
            |> List.filter identity
            |> List.length
            |> Just
