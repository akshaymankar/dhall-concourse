let Types = ../types/package.dhall

in    { name =
          "CHANGEME"
      , type =
          Types.ResourceType.InBuilt "CHANGEME"
      , source =
          None (List Types.TextTextPair)
      , version =
          None (List Types.TextTextPair)
      , params =
          None (List Types.TextTextPair)
      , check_every =
          None Text
      , tags =
          None (List Text)
      , webhook_token =
          None Text
      }
    : Types.Resource
