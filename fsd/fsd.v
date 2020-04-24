.run mapM_ echo , take 900 fsd

fsd :list int
 1 : go 1 1
 
 go n:int x:int :list int
  f > 1 ? y : go m y , z : go m z 
  
  f :int ' gcd m x
  y :int ' div x f
  z :int ' x + m + 1
  m :int ' n + 1
