let TaskConfig = ./TaskConfig.dhall

let TaskStep =
	  { task :
		  Text
	  , config :
		  TaskConfig
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
	  }

in  TaskStep