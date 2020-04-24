import System.Random
import Data.Word
-- import Debug.Trace

-- infix 0 #
-- (#) = flip trace

main :: IO ()
main = do
 gen <- newStdGen
 let ran = randomRs (0,27::Word8) gen
 mapM_ print . take 900000 $ zipf 0 ran

{- same as:
 
main = newStdGen >>= \gen -> let ran = randomRs (0,27) gen in mapM_ print . take 900000 $ zipf 0 ran

-- same thing; (getting rid of the let)

main = newStdGen >>= \gen -> mapM_ print . take 900000 $ zipf 0 (randomRs (0,27) gen)

-- or: (this works according to solonarv, find out why)

main = newStdGen >>= \gen -> pure (randomRs (0,27) gen) >>= \r -> print $ take 900000 (zipf 0 r)

-- (find out if this works)

main = ran >>= \r -> print $ take 900000 (zipf 0 r)
 where
  ran = newStdGen >>= \gen -> pure $ randomRs (0,27::Word8) gen

-}


zipf :: Word16 -> [Word8] -> [Word16]
zipf word (r:rs)
 | r == 0 = word : zipf 0 rs       -- # "word: " ++ show word
 | otherwise = zipf (succ word) rs -- # "..."
