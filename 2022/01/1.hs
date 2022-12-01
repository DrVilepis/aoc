import Data.List

main = interact $ show . maximum . map (sum . map read) . fst . foldl (\(l, ns) n -> if null n then (ns:l, []) else (l, n:ns)) ([], []) . lines
