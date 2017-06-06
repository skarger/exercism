module Bob exposing (..)

import Char


hey : String -> String
hey prompt =
    let
        questionOrWhatever =
            if String.right 1 prompt == "?" then
                "Sure."
            else
                "Whatever."
    in
        if String.trim prompt == "" then
            "Fine. Be that way!"
        else if not <| hasLetters prompt then
            questionOrWhatever
        else if String.toUpper prompt == prompt then
            "Whoa, chill out!"
        else
            questionOrWhatever


hasLetters : String -> Bool
hasLetters prompt =
    let
        charCode =
            Char.toCode << Char.toLower
    in
        String.filter
            (\c -> charCode c >= charCode 'a' && charCode c <= charCode 'z')
            prompt
            |> String.length
            |> (<) 0
