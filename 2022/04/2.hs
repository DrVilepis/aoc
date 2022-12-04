{-# LANGUAGE TypeApplications #-}

import Data.List
import Control.Arrow
import Control.Monad

main = interact $ show . length . filter (not . null) . map (uncurry intersect . join (***) (\(x:y:_) -> [x..y]) . splitAt 2 . map (read @Int . filter (`elem` ['0'..'9'])) . groupBy (curry (not . (`elem` ",-") . snd))) . lines
