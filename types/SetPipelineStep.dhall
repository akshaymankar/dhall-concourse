{ set_pipeline : Text
, file : Text
, vars : Optional ./JSONObject.dhall
, var_files : Optional (List Text)
, tags : Optional (List Text)
, timeout : Optional Text
, attempts : Optional Natural
}
