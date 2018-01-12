module Anagram exposing (..)


detect : String -> List String -> List String
detect subject =
    let
        toSortedChars =
            String.toUpper >> String.toList >> List.sort

        subjectChars =
            toSortedChars subject
    in
        List.filter (\s -> String.toUpper s /= String.toUpper subject)
            >> List.filter (toSortedChars >> (==) subjectChars)
