let Prelude =
        ../../../lib/prelude.dhall sha256:99462c205117931c0919f155a6046aec140c70fb8876d208c7c77027ab19c2fa
      ? ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic =
        ./generic.dhall sha256:e6fe28f437ac7fc2b574381ac2935273e923643d22947ddba14d941d9879955c
      ? ./generic.dhall

in  { generic = generic, text = generic Text JSON.string }
