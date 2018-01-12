module Bob exposing (hey)

import Regex


hey : String -> String
hey message =
    let
        isQuestion =
            String.endsWith "?" message

        isShouting =
            (message == String.toUpper message)
                && Regex.contains (Regex.regex "[a-zA-Z]") message

        isSilent =
            message |> String.trim |> String.isEmpty
    in
        if isShouting then
            "Whoa, chill out!"
        else if isQuestion then
            "Sure."
        else if isSilent then
            "Fine. Be that way!"
        else
            "Whatever."
