import Control.Applicative
import Data.List
import Data.Maybe

main = interact $ show . sum . map (fromMaybe 0 . flip lookup (zip (['a'..'z']++['A'..'Z']) [1..])) . map (head . uncurry intersect . liftA2 splitAt ((`div` 2) . length) id) . lines
