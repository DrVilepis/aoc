solve :: [Int] -> Int
solve xs = length $ filter (uncurry (<)) $ zip xs (tail xs)

main :: IO ()
main = interact $ show . solve . map (read) . lines
