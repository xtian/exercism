module RunLengthEncoding exposing (..)

import Regex
import Tuple


decode : String -> String
decode =
    Regex.split Regex.All (Regex.regex "([^\\d])")
        >> List.filter ((/=) "")
        >> List.foldl
            (\s ( acc, n ) ->
                case String.toInt s of
                    Ok n ->
                        ( acc, n )

                    Err _ ->
                        ( acc ++ String.repeat n s, 1 )
            )
            ( "", 1 )
        >> Tuple.first


encode : String -> String
encode =
    let
        countRuns x acc =
            case acc of
                [] ->
                    [ ( 1, x ) ]

                (( n, y ) as lastRun) :: acc ->
                    if x == y then
                        ( n + 1, x ) :: acc
                    else
                        ( 1, x ) :: lastRun :: acc
    in
        String.split ""
            >> List.foldl countRuns []
            >> List.foldl
                (\( n, x ) acc ->
                    if n == 1 then
                        x ++ acc
                    else
                        toString n ++ x ++ acc
                )
                ""


version : Int
version =
    2
