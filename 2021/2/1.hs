solve :: [String] -> Int
solve s = (\(x:y:z:_) -> x*(z-y)) $ map (count) ["forward","up","down"]
    where 
        count str = foldl (\x val -> if (head $ words val) == str then x + (read $ last $ words val) else x) 0 s

main = interact $ show . solve . lines
