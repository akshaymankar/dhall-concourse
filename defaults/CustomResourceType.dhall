let Types = ../types/package.dhall

in    { name = "CHANGEME"
      , type = "CHANGEME"
      , source = None Types.JSONObject
      , privileged = None Bool
      , params = None Types.JSONObject
      , check_every = None Text
      , tags = None Text
      , unique_version_history = None Bool
      }
    : Types.CustomResourceType
