let Types = ../types/package.dhall

in  { get = None Text
    , params = None Types.JSONObject
    , version = None Types.GetVersion
    , passed = None (List Text)
    , trigger = None Bool
    , tags = None (List Text)
    , timeout = None Text
    , attempts = None Natural
    }
