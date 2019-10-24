let JSON = (../../lib/prelude.dhall).JSON

in  ./generic.dhall
      Natural
      (λ(n : Natural) → JSON.number (Integer/toDouble (Natural/toInteger n)))
