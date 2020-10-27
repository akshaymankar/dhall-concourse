let Prelude =
        ../../../lib/prelude.dhall sha256:eb693342eb769f782174157eba9b5924cf8ac6793897fc36a31ccbd6f56dafe2
      ? ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic =
        ./generic.dhall sha256:6d74aaf570484850db87dd8e207f810a85cb97507926eee8ec485222f6758db4
      ? ./generic.dhall

in  { generic, text = generic Text JSON.string }
