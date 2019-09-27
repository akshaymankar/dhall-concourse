let Types = ../types/package.dhall

in    { get = None Text
      , resource = ./Resource.dhall
      , params = None (List Types.TextTextPair)
      , version = None Types.GetVersion
      , passed = None (List Text)
      , trigger = None Bool
      , tags = None (List Text)
      , timeout = None Text
      , attempts = None Natural
      }
    : Types.GetStep
