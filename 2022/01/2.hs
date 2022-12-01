import Data.List
import Data.Function

main = interact $ show . sum . take 3 . reverse . sort . map (sum . map read) . filter (not . any null) . groupBy ((==) `on` null) . lines
