module Sublist exposing (ListComparison(..), sublist, version)


type ListComparison
    = Equal
    | Sublist
    | Superlist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist xs ys =
    if xs == ys then
        Equal
    else if isSublist xs ys then
        Sublist
    else if isSublist ys xs then
        Superlist
    else
        Unequal


isSublist : List a -> List a -> Bool
isSublist xs ys =
    if xs == [] then
        True
    else if List.length xs > List.length ys then
        False
    else if xs == List.take (List.length xs) ys then
        True
    else
        isSublist xs (List.drop 1 ys)


version : Int
version =
    2
