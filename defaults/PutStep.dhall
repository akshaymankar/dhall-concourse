let Types = ../types/package.dhall

let PutStep
    : Types.PutStep
    = { put = None Text
      , resource = ./Resource.dhall
      , params = None (List Types.TextTextPair)
      , get_params = None (List Types.TextTextPair)
      , tags = None (List Text)
      , timeout = None Text
      , attempts = None Natural
      }

in  PutStep
