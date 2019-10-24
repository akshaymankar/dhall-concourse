let Prelude = ../lib/prelude.dhall

let Types = ../types/package.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let optionalStep = RenderOptional.generic Types.Step ./step.dhall

let optionalLogRetention =
      RenderOptional.generic
        Types.JobBuildLogRetention
        ./jobBuildLogRetention.dhall

in    λ(j : Types.Job)
    → JSON.object
        ( toMap
            { name = JSON.string j.name
            , plan =
                JSON.array
                  (Prelude.List.map Types.Step JSON.Type ./step.dhall j.plan)
            , old_name = RenderOptional.text j.old_name
            , serial = RenderOptional.bool j.serial
            , build_log_retention = optionalLogRetention j.build_log_retention
            , build_logs_to_retain =
                RenderOptional.natural j.build_logs_to_retain
            , serial_groups = RenderOptional.lists.text j.serial_groups
            , max_in_flight = RenderOptional.natural j.max_in_flight
            , public = RenderOptional.bool j.public
            , disable_manual_trigger =
                RenderOptional.bool j.disable_manual_trigger
            , interruptible = RenderOptional.bool j.interruptible
            , on_success = optionalStep j.on_success
            , on_failure = optionalStep j.on_failure
            , on_abort = optionalStep j.on_abort
            , ensure = optionalStep j.ensure
            }
        )
