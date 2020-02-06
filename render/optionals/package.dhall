let generic =
        ./generic.dhall sha256:f0bf057dec1bcaa47a86182b37add42c18e7ac38efd7f777e202df0997cc0903
      ? ./generic.dhall

let Prelude =
        ../../lib/prelude.dhall sha256:4aa8581954f7734d09b7b21fddbf5d8df901a44b54b4ef26ea71db92de0b1a12
      ? ../../lib/prelude.dhall

let JSON = Prelude.JSON

in  { generic = generic
    , bool = generic Bool JSON.bool
    , jsonObject =
          ./json-object.dhall sha256:c9530c776a00fef501f37aea4c117aa27073bfcdfe5c044f9377f93b88c002fa
        ? ./json-object.dhall
    , text = generic Text JSON.string
    , natural =
          ./natural.dhall sha256:94a91a6a10a0b55015168627142877815bb829f04c035d3b8826f86a93fa6013
        ? ./natural.dhall
    , lists =
          ./lists/package.dhall sha256:2ace5884bab544aeb6e1030decd9e0eb29254641d3fee63a65cbb3255b0d0baa
        ? ./lists/package.dhall
    , textTextMap =
          ./text-text-map.dhall sha256:db2fed5b6db90cfa183753955db4b0ca66896475c481efe2a453c3eeec337d61
        ? ./text-text-map.dhall
    , textOptionalJSONMap =
          ./text-optional-json-map.dhall sha256:05db15bd5a5aba05e555cbd7fae501804857d77d48e3368e0999e1ff90ba1a04
        ? ./text-optional-json-map.dhall
    }
