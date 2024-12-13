-- The parameter passing in Haskell uses Lazy Evaluation.
-- Haskell evaluates Parameters only when needed.
lazySquare :: Int -> Int
lazySquare x = x * x  -- 'x' is evaluated lazily
main :: IO ()
main = do
  let number = 5
  putStrLn $ "Square in Haskell (Lazy Evaluation): " ++ show (lazySquare number)

