main :: IO ()
main = do
    let result1 = lazyFunction 5   -- Fast, doesn't compute expensiveCalc
    let result2 = lazyFunction 15  -- Will need to compute expensiveCalc
    putStrLn $ "Result 1: " ++ show result1
    putStrLn $ "Result 2: " ++ show result2
-- This creates a potentially expensive calculation
expensiveCalc :: Int -> Int
expensiveCalc x = x ^ 1000000

-- This function may or may not use the expensive calculation
lazyFunction :: Int -> Int
lazyFunction x =
    if x < 10
        then x  -- expensiveCalc is never evaluated in this case
        else expensiveCalc x