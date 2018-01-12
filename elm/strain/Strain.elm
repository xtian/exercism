module Strain exposing (..)


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (not << predicate) list


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        [] ->
            []

        x :: xs ->
            if predicate x then
                x :: keep predicate xs
            else
                keep predicate xs
