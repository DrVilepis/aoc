import Data.List
import Data.Ord

bintodec :: Int -> Int
bintodec 0 = 0
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

fltr :: (String -> Char) -> Int -> [String] -> String
fltr f i xs
    | length xs > 1 = fltr f (i+1) $ filter (\x -> x!!idx == (f $ commons $ (!!idx) $ transpose xs)) xs
    | otherwise = head xs
    where
        commons = map (head) . sortBy (comparing length) . group . sort
        idx = (mod i $ length $ head xs)

solve :: [String] -> Int
solve = (\xs -> product (map (\x -> bintodec $ read $ fltr x 0 xs) [head,last]))

main = interact $ show . solve . lines
