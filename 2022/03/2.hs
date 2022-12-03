import Data.List
import Data.Maybe

main = interact $ show . sum . map (fromMaybe 0 . flip elemIndex (' ':(['a'..'z']++['A'..'Z']))) . map (head . foldl1 intersect . take 3) . takeWhile (not . null) . iterate (drop 3) . lines
