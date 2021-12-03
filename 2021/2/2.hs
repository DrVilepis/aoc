
solve :: [String] -> Int
solve s = (\(_,x,y) -> x*y) $ foldl (\(aim,depth,d) s -> if (dir s) == "up" 
            then (aim - (num s),depth,d)
        else if (dir s) == "down" 
            then (aim + (num s),depth,d)
        else if (dir s) == "forward" 
            then (\x -> (aim,depth+(aim*x),d+x)) $ num s
        else (aim,depth,d)) (0,0,0) s
    where 
        num = read . last . words 
        dir = head . words

main = interact $ show . solve . lines
