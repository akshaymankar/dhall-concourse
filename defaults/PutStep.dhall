let Types = ../types/package.dhall

in  { put = None Text
    , inputs = None (List Text)
    , params = None Types.JSONObject
    , get_params = None Types.JSONObject
    , tags = None (List Text)
    , timeout = None Text
    , attempts = None Natural
    }
