module Pangram exposing (..)

import Char
import Set


isPangram : String -> Bool
isPangram =
    String.toLower
        >> String.toList
        >> List.filter Char.isLower
        >> List.foldl Set.insert Set.empty
        >> Set.size
        >> (==) 26
