let GetStep = ./GetStep.dhall

let PutStep = ./PutStep.dhall

let TaskStep = ./TaskStep.dhall

let BasicStep = < Get : GetStep | Put : PutStep | Task : TaskStep >

in  BasicStep
