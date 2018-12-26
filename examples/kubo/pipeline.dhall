let render = ./../../render/package.dhall

let resourcesFromJobs = ./../../utils/resourcesFromJobs.dhall

let jobs = ./jobs.dhall

let resources = resourcesFromJobs jobs

in    render.resourceTypes resources
	⫽ render.resources resources
	⫽ render.jobs jobs