{ name : Text
, type : ./ResourceType.dhall
, source : Optional (List ./TextTextPair.dhall)
, version : Optional (List ./TextTextPair.dhall)
, params : Optional (List ./TextTextPair.dhall)
, check_every : Optional Text
, tags : Optional (List Text)
, webhook_token : Optional Text
}
