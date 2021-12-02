import Data.List

groups :: [Int] -> [[Int]]
groups xs
    | (length xs) > 4 = (take 3 xs):(groups (drop 4 xs))
    | otherwise = [take 3 xs]


solve :: [Int] -> Int
solve xs = length 
    $ filter (\(x,y) -> (x < y)) 
    $ (\l -> zip l (tail l)) 
    $ concat
    $ transpose 
    $ map (\x -> map (sum) $ groups $ reverse $ drop (abs x-3) $ reverse $ drop x xs) [0..3]

main = interact $ show . solve . map (read) . lines
