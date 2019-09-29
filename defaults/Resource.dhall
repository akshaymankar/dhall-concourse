let Types = ../types/package.dhall

in    { name = "CHANGEME"
      , type = Types.ResourceType.InBuilt "CHANGEME"
      , icon = None Text
      , source = None Types.JSONObject
      , version = None (List Types.TextTextPair)
      , check_every = None Text
      , tags = None (List Text)
      , public = None Bool
      , webhook_token = None Text
      }
    : Types.Resource
