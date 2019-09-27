let CustomResourceType = ./CustomResourceType.dhall

let ResourceType = < Custom : CustomResourceType | InBuilt : Text >

in  ResourceType
