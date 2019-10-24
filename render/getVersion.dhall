let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let Types = ../types/package.dhall

let renderLatest
    : Text → JSON.Type
    = λ(ignored : Text) → JSON.string "latest"

let renderEvery
    : Text → JSON.Type
    = λ(ignored : Text) → JSON.string "every"

let renderSpecific
    : List Types.TextTextPair → JSON.Type
    =   λ(version : List Types.TextTextPair)
      → JSON.object (./textTextMap.dhall version)

in    λ(version : Types.GetVersion)
    → merge
        { Latest = renderLatest
        , Every = renderEvery
        , SpecificVersion = renderSpecific
        }
        version
