let Concourse =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/types/package.dhall sha256:382b47fc87e57aa2f4e9aa72e1a2b993655f7ee61d7d16252c3c1a60dc937e7d

let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Prelude =
	  https://raw.githubusercontent.com/dhall-lang/dhall-lang/master/Prelude/package.dhall sha256:534e4a9e687ba74bfac71b30fc27aa269c0465087ef79bf483e876781602a454

in    λ(name : Text)
	→ λ(jsonKey : Text)
	→ λ(bucket : Text)
	→ λ(versionedFile : Text)
	→     Defaults.Resource
		⫽ { name =
			  name
		  , type =
			  ./../resource-types/gcs.dhall
		  , source =
			  Some
			  [ Prelude.JSON.keyText "json_key" jsonKey
			  , Prelude.JSON.keyText "bucket" bucket
			  , Prelude.JSON.keyText "versioned_file" versionedFile
			  ]
		  }
	  : Concourse.Resource