let Resource = ./Resource.dhall

in  { put : Optional Text
    , resource : Resource
    , inputs : Optional (List Text)
    , params : Optional ./JSONObject.dhall
    , get_params : Optional ./JSONObject.dhall
    , tags : Optional (List Text)
    , timeout : Optional Text
    , attempts : Optional Natural
    }
