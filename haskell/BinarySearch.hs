-- Binary Search in Haskell (Functional Paradigm)
module BinarySearch where

-- Pure functional binary search implementation
-- Uses recursion and pattern matching
binarySearch :: Ord a => [a] -> a -> Maybe Int
binarySearch arr target = search 0 (length arr - 1)
  where
    search :: Ord a => Int -> Int -> Maybe Int
    search left right
      | left > right = Nothing
      | mid == target = Just midIndex
      | target < mid = search left (midIndex - 1)
      | otherwise    = search (midIndex + 1) right
      where
        midIndex = (left + right) `div` 2
        mid = arr !! midIndex

-- Phone book search example
type Contact = (String, String)  -- (Name, Phone Number)

phoneBookSearch :: [Contact] -> String -> Maybe Contact
phoneBookSearch contacts name = 
  let sortedContacts = sortBy (\(a,_) (b,_) -> compare a b) contacts
  in case binarySearch (map fst sortedContacts) name of
       Just index -> Just (sortedContacts !! index)
       Nothing   -> Nothing

-- Example usage
contacts :: [Contact]
contacts = 
  [ ("Om", "123-456-7890")
  , ("Prachi", "234-567-8901")
  , ("Deadhack", "345-678-9012")
  , ("Roshan", "456-789-0123")
  , ("Roshni", "567-890-1234")
  ]

-- Demonstration
main :: IO ()
main = do
  let result = phoneBookSearch contacts "Deadhack"
  case result of
    Just (name, phone) -> putStrLn $ "Found: " ++ name ++ " - " ++ phone
    Nothing -> putStrLn "Contact not found"