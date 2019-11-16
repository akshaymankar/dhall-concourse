let Types = ../types/package.dhall

in  { privileged = None Bool
    , params = None (List Types.TextTextPair)
    , image = None Text
    , input_mapping = None (List Types.TextTextPair)
    , output_mapping = None (List Types.TextTextPair)
    , vars = None Types.JSONObject
    , tags = None (List Text)
    , timeout = None Text
    , attempts = None Natural
    }
