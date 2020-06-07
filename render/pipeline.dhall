let Types = ../types/package.dhall

let Extract = ../extractors/package.dhall

let renderResources = ./resources.dhall

let renderResourceTypes = ./resourceTypes.dhall

let renderJobs = ./jobs.dhall

in  λ(jobs : List Types.Job) →
      let resources = Extract.resourcesFromJobs jobs

      let resource_types = Extract.resourceTypesFromResources resources

      in  { jobs = renderJobs jobs
          , resources = renderResources resources
          , resource_types = renderResourceTypes resource_types
          }
