module SumOfMultiples exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples factors max =
    List.range 1 (max - 1)
        |> List.filter (\x -> List.any (\y -> x % y == 0) factors)
        |> List.sum
