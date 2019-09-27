let Types = ../types/package.dhall

in    { path =
          "CHANGEME"
      , args =
          None (List Text)
      , dir =
          None Text
      , user =
          None Text
      }
    : Types.TaskRunConfig
