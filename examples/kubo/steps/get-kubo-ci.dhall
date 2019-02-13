let Defaults =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/defaults/package.dhall sha256:420e809a4f6474c4c7bc95746a53dbd9c3a3f06695f2d8128c0d71fdd025cd8e

let Helpers =
	  https://raw.githubusercontent.com/akshaymankar/dhall-concourse/master/helpers/package.dhall sha256:384962d223b7a61a7d02ae56aeb7f931a924e2b64ce4f6d156375801af574841

in  Helpers.getStep
	(Defaults.GetStep ⫽ { resource = ../resources/git-kubo-ci.dhall })