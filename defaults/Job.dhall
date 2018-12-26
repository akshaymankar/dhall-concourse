   let Step = ../types/Step.dhall
in let Job = ../types/Job.dhall
in { name = "CHANGEME"
   , plan = [] : List Step
   , serial = None Bool
   , build_logs_to_retain = None Natural
   , serial_groups = None (List Text)
   , max_in_flight = None Natural
   , public = None Bool
   , disable_manual_trigger = None Bool
   , interruptible = None Bool
   , on_success = None Step
   , on_failure = None Step
   , on_abort = None Step
   , ensure = None Step
   } : Job
