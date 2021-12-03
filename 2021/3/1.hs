import Data.List
import Data.Ord

bintodec 0 = 0
bintodec i = 2 * bintodec (div i 10) + (mod i 10)

solve :: [String] -> Int
solve xs = product
    $ map (bintodec . read)
    $ transpose 
    $ map (map (head) . sortBy (comparing length) . group . sort)
    $ transpose xs 

main = interact $ show . solve . lines
