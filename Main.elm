port module Main exposing (..)

import Html exposing (Html)
import Json.Encode


-- main : Program Never Model Msg


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
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
    Nothing ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    model ! []


view : Model -> Html Msg
view _ =
    Html.text "I'm working"
