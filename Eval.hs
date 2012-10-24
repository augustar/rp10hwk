module Eval where

import Syntax

eval :: Expression -> Int
eval (Value x) = x
eval (Add e1 e2) = (eval e1) + (eval e2)