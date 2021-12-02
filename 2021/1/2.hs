import Data.List

groups :: [Int] -> [[Int]]
groups xs
    | (length xs) > 3 = (take 3 xs):(groups (drop 1 xs))
    | otherwise = [take 3 xs]


solve :: [Int] -> Int
solve xs = length 
    $ filter (\(x,y) -> (x < y)) 
    $ (\l -> zip l (tail l)) 
    $ map (sum)
    $ groups xs

main = interact $ show . solve . map (read) . lines
