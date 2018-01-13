module WordCount exposing (..)

import Dict exposing (Dict)
import Regex


wordCount : String -> Dict String Int
wordCount =
    let
        countWord =
            Maybe.map ((+) 1 >> Just) >> Maybe.withDefault (Just 1)
    in
        String.toLower
            >> Regex.replace Regex.All (Regex.regex "[^a-z0-9\\s]") (always "")
            >> String.words
            >> List.foldl (\s d -> Dict.update s countWord d) Dict.empty
