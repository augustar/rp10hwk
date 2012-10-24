module Parse where

import Syntax

                


parse :: String -> Expression
parse s = Add (Value x) (Value y)
          where
          (s1,s2) = break (=='+') s
          s3 = tail s2
          x = read s1 :: Int
          y = read s3 :: Int

 
