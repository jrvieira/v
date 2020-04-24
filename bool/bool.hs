data Bl = F | V
   deriving Show

nt :: Bl -> Bl
nt V = F
nt _ = V

nd :: Bl -> Bl -> Bl
nd V = id
nd _ = const F

ou :: Bl -> Bl -> Bl
ou V = const V
ou _ = id

main :: IO ()
main = do
   print $ nt V
   print $ nt F

   print $ nd F F
   print $ nd V F
   print $ nd F V
   print $ nd V V
   
   print $ ou F F
   print $ ou V F
   print $ ou F V
   print $ ou V V
