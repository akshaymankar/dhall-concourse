let BasicStep = ./BasicStep.dhall

let Step = < Basic : BasicStep | Aggregate : List BasicStep >

in  Step