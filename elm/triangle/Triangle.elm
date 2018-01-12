module Triangle exposing (..)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    let
        isDegenerate =
            case List.sort [ a, b, c ] of
                a :: b :: c :: _ ->
                    a + b <= c

                _ ->
                    True
    in
        if List.any (\x -> x <= 0) [ a, b, c ] then
            Err "Invalid lengths"
        else if isDegenerate then
            Err "Violates inequality"
        else if (a == b) && (b == c) then
            Ok Equilateral
        else if (a == b) || (b == c) || (a == c) then
            Ok Isosceles
        else
            Ok Scalene


version : Int
version =
    2
