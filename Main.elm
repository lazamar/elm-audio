port module Main exposing (..)

import Html exposing (Html)
import Json.Encode


-- main : Program Never Model Msg


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- In


port takeAudio : (Json.Encode.Value -> msg) -> Sub msg



-- Out


port createAudio : String -> Cmd msg


port play : Json.Encode.Value -> Cmd msg


port pause : Json.Encode.Value -> Cmd msg


port restart : Json.Encode.Value -> Cmd msg


type Msg
    = TakeJson Json.Encode.Value
    | Play
    | Stop
    | Restart


type alias Model =
    Maybe Json.Encode.Value


init : ( Model, Cmd Msg )
init =
    Nothing ! [ createAudio "http://kingston-rp.org/mp3/ambient/Burning%20Fireplace%20with%20Crackling%20Fire%20Sounds%20(Full%20HD).mp3" ]


subscriptions mode =
    takeAudio TakeJson


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TakeJson json ->
            Just json ! [ play json ]

        _ ->
            model ! []


view : Model -> Html Msg
view _ =
    Html.text "I'm working"
