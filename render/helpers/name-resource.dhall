let Types = ../../types/package.dhall

let Prelude = ../../lib/prelude.dhall

let JSON = Prelude.JSON

let getName
    : Optional Text → Types.Resource → JSON.Type
    =   λ(name : Optional Text)
      → λ(resource : Types.Resource)
      → JSON.string (Prelude.Optional.default Text resource.name name)

let getResource
    : Optional Text → Types.Resource → JSON.Type
    =   λ(name : Optional Text)
      → λ(resource : Types.Resource)
      →       if Prelude.Optional.null Text name
        
        then  JSON.null
        
        else  JSON.string resource.name

in  { getName = getName, getResource = getResource }
