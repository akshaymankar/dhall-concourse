let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let Resource = Types.Resource

let ResourceType = Types.ResourceType

in    Prelude.List.map Resource ResourceType (λ(r : Resource) → r.type)
    : List Resource → List ResourceType
