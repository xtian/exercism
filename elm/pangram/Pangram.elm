module Pangram exposing (..)

import Char
import Set


isPangram : String -> Bool
isPangram =
    String.toLower
        >> String.filter Char.isLower
        >> String.foldl Set.insert Set.empty
        >> Set.size
        >> (==) 26
