module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    let
        makeSlices input =
            if List.length input < size then
                []
            else
                List.take size input :: makeSlices (List.drop 1 input)
    in
    if size == 0 then
        Err "Invalid size: 0"
    else
        String.split "" input
            |> List.map String.toInt
            |> List.foldr (Result.map2 (::)) (Ok [])
            |> Result.map makeSlices
