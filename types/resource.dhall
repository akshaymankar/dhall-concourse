{ name : Text
, type : ./resourceType.dhall
, source : Optional (List ./map.dhall)
, version : Optional (List ./map.dhall)
, params: Optional (List ./map.dhall)
, check_every: Optional Text
, tags: Optional (List Text)
, webhook_token: Optional Text
}
