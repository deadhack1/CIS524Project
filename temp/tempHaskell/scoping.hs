-- Static Scoping in Haskell
-- A variable's scope is fixed during compilation.

module Main where

outerFunction :: Int
outerFunction = let x = 10 in innerFunction x
  where
    innerFunction y = y  -- Fixed at compile-time to outer 'x'

main :: IO ()
main = putStrLn $ "Static Scoping (Haskell): x = " ++ show outerFunction
  