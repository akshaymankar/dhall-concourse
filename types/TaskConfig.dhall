{ platform : Text
, run : ./TaskRunConfig.dhall
, image_resource : Optional ./ImageResource.dhall
, rootfs_uri : Optional Text
, container_limits : Optional ./TaskContainerLimits.dhall
, inputs : Optional (List ./TaskInput.dhall)
, outputs : Optional (List ./TaskOutput.dhall)
, caches : Optional (List ./TaskCache.dhall)
, params : Optional (List { mapKey : Text, mapValue : Optional Text })
}
