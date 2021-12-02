solve :: [String] -> Int
solve s = do
    let x = foldl (\x s -> if (head $ words s) == "forward" then x + (read $ last $ words s) else x) 0 s
    let y = foldl (\x s -> if (head $ words s) == "up" then x + (read $ last $ words s) else x) 0 s
    let z = foldl (\x s -> if (head $ words s) == "down" then x + (read $ last $ words s) else x) 0 s
    x*(y-z)

main = interact $ show . solve . lines
