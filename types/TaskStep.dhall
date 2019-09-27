{ task :
    Text
, config :
    ./TaskSpec.dhall
, privileged :
    Optional Bool
, params :
    Optional (List ./TextTextPair.dhall)
, image :
    Optional Text
, input_mapping :
    Optional (List ./TextTextPair.dhall)
, output_mapping :
    Optional (List ./TextTextPair.dhall)
, tags :
    Optional (List Text)
, timeout :
    Optional Text
, attempts :
    Optional Natural
}
