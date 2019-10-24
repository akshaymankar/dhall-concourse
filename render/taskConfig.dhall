let Types = ../types/package.dhall

let Prelude = ../lib/prelude.dhall

let JSON = Prelude.JSON

let RenderOptional = ./optionals/package.dhall

let TextOptionalTextPair = { mapKey : Text, mapValue : Optional Text }

let render
    : Types.TaskConfig → JSON.Type
    =   λ(c : Types.TaskConfig)
      → JSON.object
          ( toMap
              { platform = JSON.string c.platform
              , run = ./taskRunConfig.dhall c.run
              , image_resource = ./imageResource.dhall c.image_resource
              , rootfs_uri = RenderOptional.text c.rootfs_uri
              , container_limits =
                  ./taskContainerLimits.dhall c.container_limits
              , inputs =
                  RenderOptional.lists.generic
                    Types.TaskInput
                    ./taskInput.dhall
                    c.inputs
              , outputs =
                  RenderOptional.lists.generic
                    Types.TaskOutput
                    ./taskOutput.dhall
                    c.outputs
              , caches =
                  RenderOptional.lists.generic
                    Types.TaskCache
                    ./taskCache.dhall
                    c.caches
              , params =
                  RenderOptional.jsonObject
                    ( Prelude.Optional.map
                        (List TextOptionalTextPair)
                        Types.JSONObject
                        ./textOptionalTextMap.dhall
                        c.params
                    )
              }
          )

in  render
