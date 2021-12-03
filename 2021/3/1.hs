import Data.List
import Data.Ord

bintodec :: Int -> Int
bintodec 0 = 0
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

solve :: [String] -> Int
solve = product
    . map (bintodec . read)
    . transpose 
    . map (map (head) . sortBy (comparing length) . group . sort)
    . transpose

main = interact $ show . solve . lines
