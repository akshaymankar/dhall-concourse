let generic =
        ./generic.dhall sha256:e87b80b1ddea0190e04f34886ec715b8248fdfd87d0f52b2d98c9db8c9bfa58e
      ? ./generic.dhall

let Prelude =
        ../../lib/prelude.dhall sha256:99462c205117931c0919f155a6046aec140c70fb8876d208c7c77027ab19c2fa
      ? ../../lib/prelude.dhall

let JSON = Prelude.JSON

in  { generic =
        generic
    , bool = generic Bool JSON.bool
    , jsonObject =
          ./json-object.dhall sha256:a716dcfe232f9281dba641ec8667f649cd66ecfb49adc0d606f2c141b6806a7b
        ? ./json-object.dhall
    , text = generic Text JSON.string
    , natural =
          ./natural.dhall sha256:d905b04cbe71416d5792ce04f107e7ceadebb5ff6bb3170bebd2766cc3783e5a
        ? ./natural.dhall
    , lists =
          ./lists/package.dhall sha256:ea18f4a4c82d3876a94db607d4afdc86342cace7368401c8911c0e3cb2ffc4b7
        ? ./lists/package.dhall
    , textTextMap =
          ./text-text-map.dhall sha256:ee10a9fce1cf002a2ee6c6ca395e274d7e877ee7365646d927c8bb9f6181249b
        ? ./text-text-map.dhall
    , textOptionalJSONMap =
          ./text-optional-json-map.dhall sha256:537bb2f57868dd144aa4c8b68de775557d235b87af4b03b40b8d9ce02f7d2a3b
        ? ./text-optional-json-map.dhall
    }
