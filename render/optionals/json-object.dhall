let JSON = (../../lib/prelude.dhall).JSON

let JSONObject = ../../types/JSONObject.dhall

let paramsToJSON
    : Optional JSONObject → JSON.Type
    = ./generic.dhall JSONObject JSON.object

in  paramsToJSON
