module RNATranscription exposing (..)

import Dict exposing (Dict)


toRNA : String -> Result Char String
toRNA =
    String.toList
        >> List.map (\c -> Dict.get c bases |> Result.fromMaybe c)
        >> List.foldr (Result.map2 (++)) (Ok "")


bases : Dict Char String
bases =
    Dict.fromList
        [ ( 'G', "C" )
        , ( 'C', "G" )
        , ( 'T', "A" )
        , ( 'A', "U" )
        ]
