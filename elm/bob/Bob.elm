module Bob exposing (hey)

import Regex exposing (regex)
import String


hey : String -> String
hey message =
    if isShouting message then
        "Whoa, chill out!"
    else if isQuestion message then
        "Sure."
    else if isSilence message then
        "Fine. Be that way!"
    else
        "Whatever."


isQuestion : String -> Bool
isQuestion message =
    message |> String.endsWith "?"


isShouting : String -> Bool
isShouting message =
    let
        hasLetters =
            Regex.contains (regex "[a-zA-Z]")
    in
        (hasLetters message) && (String.toUpper message == message)


isSilence : String -> Bool
isSilence =
    String.trim >> String.isEmpty
