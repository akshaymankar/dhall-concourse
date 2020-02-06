let Prelude =
        ../../../lib/prelude.dhall sha256:4aa8581954f7734d09b7b21fddbf5d8df901a44b54b4ef26ea71db92de0b1a12
      ? ../../../lib/prelude.dhall

let JSON = Prelude.JSON

let generic =
        ./generic.dhall sha256:3be094cbf1079f18bb0ee0fe8421fd19c6b3f3fdc9283c3c83345059694f92d8
      ? ./generic.dhall

in  { generic = generic, text = generic Text JSON.string }
