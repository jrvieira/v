a = [0,1,2]
b = [6,7,8,9]

main = print $ cartesian a b

cartesian :: [Int] -> [Int] -> [(Int,Int)]
cartesian xs ys = go xs ys
 where 
  go [] _ = []
  go (x:xx) [] = go xx ys
  go xs@(x:xx) (y:yy) = (x,y):go xs yy

