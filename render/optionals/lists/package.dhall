let Prelude =
        ../../../lib/prelude.dhall sha256:7e2b87add393288298baabc73119601182d04630b9989bdb9ac0822dc0863b38
      ? ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic =
        ./generic.dhall sha256:6d74aaf570484850db87dd8e207f810a85cb97507926eee8ec485222f6758db4
      ? ./generic.dhall

in  { generic, text = generic Text JSON.string }
