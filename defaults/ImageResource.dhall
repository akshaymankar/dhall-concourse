let Types = ../types/package.dhall

in    { type = "CHANGEME"
      , source = None Types.JSONObject
      , params = None Types.JSONObject
      , version = None (List Types.TextTextPair)
      }
    : Types.ImageResource
