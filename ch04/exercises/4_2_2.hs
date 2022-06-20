module ExFourTwoTwo where

import Control.Monad.Writer
import Data.Monoid

-- Some ideas to expand on this:
-- if I also implemented the multi-step evaluation, then I could write property tests that compare the two
--   to check that
--     the evaluated term is always the same
--     the number of evaluation steps for the big-step is less or equal than multi-step
--   it would be fun to add a little step counter, maybe as a Writer Monad?

data Term =
    TmTrue
  | TmFalse
  | TmIf Term Term Term
  | TmZero
  | TmSucc Term
  | TmPred Term
  | TmIsZero Term
  deriving (Show)

isValue :: Term -> Bool
isValue TmTrue = True
isValue TmFalse = True
isValue a
  | isNumericValue a = True
  | otherwise = False

isNumericValue :: Term -> Bool
isNumericValue TmZero = True
isNumericValue (TmSucc term) = isNumericValue term
isNumericValue _ = False

eval :: Term -> Term
eval (TmIf t1 t2 t3) =
  case (eval t1, eval t2, eval t3) of
    (TmTrue, t2', _) -> t2'                             -- B-IF-TRUE
    (TmFalse, _, t3') -> t3'                            -- B-IF-FALSE
    _ -> error "invalid if/else term"
eval (TmSucc term)                                      -- B-SUCC
  | isNumericValue (eval term) = TmSucc (eval term)
  | otherwise = error "invalid succ term"
eval (TmPred term)
  | TmZero <- (eval term) = TmZero                      -- B-PREDZERO
  | TmSucc number <- (eval term) = number               -- B-PREDSUCC
  | otherwise = error "invalid pred term"
eval (TmIsZero term)
  | TmZero <- (eval term) = TmTrue                      -- B-ISZERO
  | TmSucc _ <- (eval term) = TmFalse                   -- B-ISZEROSUCC
eval term
  | isValue term = term                                 -- B-VALUE
  | otherwise = error "none of the evaluation rules apply"

