module NucleotideCount exposing (nucleotideCounts, version)


version : Int
version =
    2


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts =
    let
        countBase base counts =
            case base of
                'A' ->
                    { counts | a = counts.a + 1 }

                'T' ->
                    { counts | t = counts.t + 1 }

                'C' ->
                    { counts | c = counts.c + 1 }

                'G' ->
                    { counts | g = counts.g + 1 }

                _ ->
                    counts
    in
    String.foldl countBase (NucleotideCounts 0 0 0 0)
