module Stage2.Test (
    Testcase,
    testcases
) where

import Stage2.Base (Assembler(..), AInstruction(..), ADest(..))
import Stage2.Assembler (assemble)
import Common.Simulator (Instruction(..), LeftOrRight(..))

-- | Assembler program and expected result.
type Testcase = (String, Assembler, Maybe [Instruction])

validProgram :: Assembler
validProgram = Assembler [
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


testLoop1 :: Assembler
testLoop1 = Assembler [(["start"], ANop), (["end1"], AGoto "end2"), (["end2"], AGoto "end1")]

testLoop2 :: Assembler
testLoop2 = Assembler [(["start"], ANop), (["end1"], AGoto "end2"), (["end2"], AGoto "end3"), (["end3"], AGoto "end2")]

testLoop3 :: Assembler
testLoop3 = Assembler [(["start"], ANop), (["end1"], AGoto "end2"), (["end2"], AJump (-1))]

testLoop4 :: Assembler
testLoop4 = Assembler [(["start"], ANop), (["end1"], AJump 1), (["end2"], AGoto "end1")]

testLoop5 :: Assembler
testLoop5 = Assembler [([], ANop), ([], AJump 1), ([], AJump (-1))]


-- TODO: check for uniqueness of labels. This test fails right now (by not throwing an error).
testUniqueLabels :: Assembler
testUniqueLabels = Assembler [(["start"], ANop), (["start"], ANop)]

-- TODO: collection of testcases.
testcases :: [Testcase]
testcases = undefined
