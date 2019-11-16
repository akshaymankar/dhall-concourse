let Types = ../types/package.dhall

in  { platform = "linux"
    , container_limits = None Types.TaskContainerLimits
    , image_resource = None Types.ImageResource
    , rootfs_uri = None Text
    , inputs = None (List Types.TaskInput)
    , outputs = None (List Types.TaskOutput)
    , caches = None (List Types.TaskCache)
    , params = None (List { mapKey : Text, mapValue : Optional Text })
    }
