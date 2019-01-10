let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/with-json-exts/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/with-json-exts/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Helpers =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/with-json-exts/helpers/package.dhall sha256:669688ff921a0fcda3268d22b769b9075818a0ddb4cb3566c8fca190a7c3384a

let acmeVersion = ../resources/acmeVersion.dhall

let bumpMinorStep
	: Concourse.Step
	= Helpers.putStep
	  (   Defaults.PutStep
		⫽ { resource =
			  acmeVersion
		  , params =
			  Some [ { mapKey = "bump", mapValue = "minor" } ]
		  }
	  )

in    Defaults.Job ⫽ { name = "bump-minor", plan = [ bumpMinorStep ] }
	: Concourse.Job