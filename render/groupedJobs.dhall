let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

in  λ(groupedJobs : List Types.GroupedJob) →
      let jobs =
            Prelude.List.map
              Types.GroupedJob
              Types.Job
              (λ(groupedJob : Types.GroupedJob) → groupedJob.job)
              groupedJobs

      let RenderedGroup = { name : Text, jobs : List Text }

      let jobGroups
          : List RenderedGroup
          = Prelude.List.concatMap
              Types.GroupedJob
              RenderedGroup
              ( λ(groupedJob : Types.GroupedJob) →
                  Prelude.List.map
                    Text
                    RenderedGroup
                    (λ(g : Text) → { name = g, jobs = [ groupedJob.job.name ] })
                    groupedJob.groups
              )
              groupedJobs

      in  ./pipeline.dhall jobs ⫽ { groups = jobGroups }
