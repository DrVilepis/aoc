import Data.List

split :: String -> [String]
split s = case dropWhile (==',') s of
    "" -> []
    s' -> w : split s''
        where (w, s'') = break (==',') s'

parse :: [String] -> [[[Int]]]
parse xs
    | length xs > 5 = board:(parse $ drop 6 xs)
    | otherwise = [board]
    where
        board = map (map (read) . words) $ take 5 xs
    
play :: [[[Int]]] -> [Int] -> Int
play boards nums
    | length x > 1 = play x $ tail nums
    | otherwise = (head nums) * (checkWin $ head y)
    where 
        (x,y) = partition ((== -1) . checkWin) $ map (flip checkNums (head nums)) boards
    
checkNums :: [[Int]] -> Int -> [[Int]]
checkNums board n = map (map (\x -> if (x==n) then -1 else x)) board

checkWin :: [[Int]] -> Int
checkWin xs = if (any (all (== -1)) xs) || (any (all (== -1)) $ transpose xs) then sum $ filter (>=0) $ concat xs else -1

solve :: [String] -> Int
solve xs = do
    let nums = map (read) $ split $ head xs
    let boards = parse $ drop 2 xs
    play boards nums

main :: IO ()
main = interact $ show . solve . lines
