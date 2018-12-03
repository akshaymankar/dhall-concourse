let someFile = ./resources/some-file-on-gcs.dhall
let mkResourceTypes = ./functions/mkResourceTypes.dhall
let mkResources = ./functions/mkResources.dhall
in mkResourceTypes [someFile]
  //
  mkResources [someFile]
