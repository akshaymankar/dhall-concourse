./default.dhall
//
{ name = "gcs-some-file"
, type = ../resource-types/gcs-resource.dhall
, source = Some [{ mapKey = "bucket", mapValue = "my-awesome-bucket"}
                ,{ mapKey = "json_key", mapValue = "super-secret-json" }]
} : ../types/resource.dhall
