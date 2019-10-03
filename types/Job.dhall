let Step = ./Step.dhall

in  { name : Text
    , old_name : Optional Text
    , plan : List Step
    , serial : Optional Bool
    , build_log_retention :
        Optional ./JobBuildLogRetention.dhall
    , build_logs_to_retain : Optional Natural
    , serial_groups : Optional (List Text)
    , max_in_flight : Optional Natural
    , public : Optional Bool
    , disable_manual_trigger : Optional Bool
    , interruptible : Optional Bool
    , on_success : Optional Step
    , on_failure : Optional Step
    , on_abort : Optional Step
    , ensure : Optional Step
    }
