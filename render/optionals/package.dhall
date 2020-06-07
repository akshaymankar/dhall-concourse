let generic =
        ./generic.dhall sha256:a9c086f0320de0f535a61da9c9677b394bd9919c84d68b73eb0fa2354e4054fd
      ? ./generic.dhall

let Prelude =
        ../../lib/prelude.dhall sha256:7e2b87add393288298baabc73119601182d04630b9989bdb9ac0822dc0863b38
      ? ../../lib/prelude.dhall

let JSON = Prelude.JSON

in  { generic
    , bool = generic Bool JSON.bool
    , jsonObject =
          ./json-object.dhall sha256:50dabedc3c66450582fcdfc8db8dd6e4edb29a008d9a091835286d8ff4fd7867
        ? ./json-object.dhall
    , text = generic Text JSON.string
    , natural =
          ./natural.dhall sha256:811a4fed2044e65bc54ade5debe34859a42f16e362df6b23dd3f72ae312e6073
        ? ./natural.dhall
    , lists =
          ./lists/package.dhall sha256:7bf36ced6fad25f8d7e5fd8226b1137111d5a0b2dfacda88d0f37e35d044186e
        ? ./lists/package.dhall
    , textTextMap =
          ./text-text-map.dhall sha256:7a8458295cb243fd75927d8aeb0e3801cf1435f4092c2809355bdf4aaf7afa81
        ? ./text-text-map.dhall
    , textOptionalJSONMap =
          ./text-optional-json-map.dhall sha256:f98c457bbda831ea3b5d69a3d303e2f2c5d20aa8e131db41c3795eab8db76c6c
        ? ./text-optional-json-map.dhall
    }
