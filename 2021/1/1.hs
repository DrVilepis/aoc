solve :: [Int] -> Int
solve xs = length $ filter (\(x,y) -> x < y) $ zip xs (tail xs)

main = interact $ show . solve . map (read) . lines
