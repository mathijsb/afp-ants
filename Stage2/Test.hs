module Stage2.Test (
    Testcase,
    testcases
) where

import Stage2.Base (Assembler)
import Stage2.Assembler (assemble)
import Common.Simulator (Instruction)

-- | Assembler program and expected result.
type Testcase = (String, Assembler, Maybe [Instruction])

validProgram :: Assembler
validProgram = [
    (["start"], ATurn IsLeft),
    ([]       , ATurn IsLeft),
    ([]       , AMove (ARelative 6)),
    ([]       , AGoto "start"),
    (["error"], ANop),
    ([]       , AGoto "error"),
    (["error3"], AGoto "error2"),
    (["error2"], AGoto "error"),
    (["error4"], AGoto "error3")
  ]


-- Simple test for GOTO cycle detection. This test should succeed right now.
testGotoLoop :: Assembler
testGotoLoop = [(["start"], ANop), (["end1"], AGoto "end2"), (["end2"], AGoto "end1")]

-- TODO: check for uniqueness of labels. This test fails right now (by not throwing an error).
testUniqueLabels :: Assembler
testUniqueLabels = [(["start"], ANop), (["start"], ANop)]

-- TODO: collection of testcases.
testcases :: [Testcase]
testcases = undefined
