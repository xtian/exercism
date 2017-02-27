module Raindrops exposing (..)


type alias DropDefinition =
    ( Int, String )


raindrops : Int -> String
raindrops n =
    let
        sounds =
            List.foldl (addSound n) "" factors
    in
        if String.isEmpty sounds then
            toString n
        else
            sounds


addSound : Int -> DropDefinition -> String -> String
addSound n ( factor, sound ) acc =
    if (rem n factor) == 0 then
        acc ++ sound
    else
        acc


factors : List DropDefinition
factors =
    [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]
