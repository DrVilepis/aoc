solve :: [String] -> Int
solve s = do
    let (x,y,z) = foldl (.\(aim,depth,d) s -> if (head $ words s) == "up" 
            then (aim - (read $ last $ words s),depth,d) 
        else if (head $ words s) == "down" 
            then (aim + (read $ last $ words s),depth,d) 
        else if (head $ words s) == "forward" 
            then (\x -> (aim,depth+(aim*x),d+x)) $ read $ last $ words s 
        else (aim,depth,x)) (0,0,0) s
    y*z


main = interact $ show . solve . lines
