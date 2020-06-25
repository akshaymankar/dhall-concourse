let Prelude =
        ../../../lib/prelude.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
      ? ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic =
        ./generic.dhall sha256:6d74aaf570484850db87dd8e207f810a85cb97507926eee8ec485222f6758db4
      ? ./generic.dhall

in  { generic, text = generic Text JSON.string }
