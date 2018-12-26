let someFile = ./../../resources/some-file-on-gcs.dhall

let mkResourceTypes = ./../../functions/mkResourceTypes.dhall

let mkResources = ./../../functions/mkResources.dhall

let renderJobs = ./../../functions/renderJobs.dhall

let resourcesFromJobs = ./../../functions/resourcesFromJobs.dhall

let jobs = ./jobs.dhall

let resources = resourcesFromJobs jobs

in  mkResourceTypes resources ⫽ mkResources resources ⫽ renderJobs jobs