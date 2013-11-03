-- | Small collection of test cases for initial validation of the assembler
-- validator and assembler output.
--
-- All testcases are assumed to be at least parseable.

module Stage2.Test (
    testcases,
    test,
    allTestsPass
) where

import Data.Maybe

import Stage2.PrettyPrint (Ant(..))
import Stage2.Assembler (assemble, validate)
import Stage2.Parse (parseAssembler)

-- | Assembler program and expected result.
type Testcase = (String, Maybe String)

-- | Self-test indicator: 'True' if all testcases in 'testcases' pass.
allTestsPass :: Bool
allTestsPass = all test testcases

-- | Test a testcase, 'True' if the testcase succeeds.
test :: Testcase -> Bool
test (i, o) = let a = parseAssembler i in
              case validate a of
                Left e -> isNothing o
                Right v -> isJust o && let is = assemble v in
                                       (== fromJust o) . show $ Ant is

-- | Collection of testcases for the assembler and validator.
testcases :: [Testcase]
testcases = [validProgram, testLoop1, testLoop2, testLoop3, testLoop4, testLoop5,
             testUniqueLabels]

invalid :: String -> Testcase
invalid s = (s, Nothing)

valid :: String -> String -> Testcase
valid i o = (i, Just o)

-- ================
-- Succeeding tests
-- ================

validProgram :: Testcase
validProgram = valid "start:\n    TURN LEFT\n    TURN LEFT\n    MOVE OR JUMP 6\n    GOTO START\nerror:\n    NOP\n    GOTO ERROR\nerror3:\n    GOTO ERROR2\nerror2:\n    GOTO ERROR\nerror4:\n    GOTO ERROR3\n"
                     "Turn Left 1\nTurn Left 2\nMove 0 3\nFlip 1 3 3\n"

-- ==========================
-- Failing tests (on purpose)
-- ==========================

testLoop1 :: Testcase
testLoop1 = invalid "start:\n    NOP\nend1:\n    GOTO END2\nend2:\n    GOTO END1\n"

testLoop2 :: Testcase
testLoop2 = invalid "start:\n    NOP\nend1:\n    GOTO END2\nend2:\n    GOTO END3\nend3:\n    GOTO END2\n"

testLoop3 :: Testcase
testLoop3 = invalid "start:\n    NOP\nend1:\n    GOTO END2\nend2:\n    JUMP -1\n"

testLoop4 :: Testcase
testLoop4 = invalid "start:\n    NOP\nend1:\n    JUMP 1\nend2:\n    GOTO END1\n"

testLoop5 :: Testcase
testLoop5 = invalid "    NOP\n    JUMP 1\n    JUMP -1\n"

testUniqueLabels :: Testcase
testUniqueLabels = invalid "start:\n    NOP\nstart:\n    NOP\n"

