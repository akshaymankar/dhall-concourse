let Prelude = ../../lib/prelude.dhall

let Types = ../../types/package.dhall

in    λ(x : Optional (List Types.TextTextPair))
    → ./json-object.dhall
        ( Prelude.Optional.map
            (List Types.TextTextPair)
            Types.JSONObject
            ../textTextMap.dhall
            x
        )
