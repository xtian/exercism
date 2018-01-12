module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate mapper list =
    case list of
        [] ->
            []

        x :: xs ->
            mapper x :: accumulate mapper xs
