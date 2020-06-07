let Types = ../types/package.dhall

in  { old_name = None Text
    , serial = None Bool
    , build_log_retention = None Types.JobBuildLogRetention
    , build_logs_to_retain = None Natural
    , serial_groups = None (List Text)
    , max_in_flight = None Natural
    , public = None Bool
    , disable_manual_trigger = None Bool
    , interruptible = None Bool
    , on_success = None Types.Step
    , on_failure = None Types.Step
    , on_abort = None Types.Step
    , ensure = None Types.Step
    }
