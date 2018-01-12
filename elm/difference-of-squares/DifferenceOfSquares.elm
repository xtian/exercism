module DifferenceOfSquares exposing (..)


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n


squareOfSum : Int -> Int
squareOfSum n =
    List.range 1 n
        |> List.sum
        |> flip (^) 2


sumOfSquares : Int -> Int
sumOfSquares n =
    List.range 1 n
        |> List.map (flip (^) 2)
        |> List.sum
