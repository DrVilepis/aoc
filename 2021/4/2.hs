import Data.List

split :: String -> [String]
split s = case dropWhile (==',') s of
    "" -> []
    s' -> w : split s''
        where (w, s'') = break (==',') s'

parse :: [String] -> [[[Int]]]
parse xs
    | length xs > 5 = (map (map (read) . words) $ take 5 xs):(parse $ drop 6 xs)
    | otherwise = (map (map (read) . words) $ take 5 xs)
    
play :: [[[Int]]] -> [[Int]] -> Int
play boards nums = do
    let (x,y) = partition (\x -> (fst $ checkWin x $ head nums)) boards
    if length y == 0 && length x == 1 then
        snd $ checkWin (head x) $ head nums
    else
        play y $ tail nums
    
checkWin :: [[Int]] -> [Int] -> (Bool,Int)
checkWin board nums = do 
    let filtered = map (map(\x -> if any (==x) nums then -1 else x)) board
    let winner = (\x -> (any (all (==(-1))) x) || (any (all (==(-1))) $ transpose x)) filtered :: Bool
    (winner,if winner then (*last nums) $ sum $ filter (>=0) $ concat filtered else 0)

solve :: [String] -> Int
solve xs = do
    let nums = map (read) $ split $ head xs :: [Int]
    let boards = parse $ drop 2 xs
    play boards $ tail $ inits $ nums

main :: IO ()
main = interact $ show . solve . lines
