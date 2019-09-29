{ name : Text
, type : ./ResourceType.dhall
, icon : Optional Text
, source : Optional ./JSONObject.dhall
, version : Optional (List ./TextTextPair.dhall)
, check_every : Optional Text
, tags : Optional (List Text)
, public: Optional Bool
, webhook_token : Optional Text
}
