module Syntax where

data Expression = Value Int 
                | Add Expression Expression

instance Show Expression where
	show (Value x) = show x