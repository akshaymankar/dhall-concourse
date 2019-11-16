let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

in    λ(groupedJobs : List Types.GroupedJob)
    → let jobs =
            Prelude.List.map
              Types.GroupedJob
              Types.Job
              (λ(groupedJob : Types.GroupedJob) → groupedJob.job)
              groupedJobs
      
      let jobGroups =
            Prelude.List.map
              Types.GroupedJob
              (Prelude.Map.Entry Text (List Text))
              (   λ(groupedJob : Types.GroupedJob)
                → Prelude.Map.keyValue
                    (List Text)
                    groupedJob.job.name
                    groupedJob.groups
              )
              groupedJobs
      
      in  ./pipeline.dhall jobs ⫽ { jobGroups = jobGroups }
