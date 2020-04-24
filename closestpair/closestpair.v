.run print solution

a :list int
 -1 : 3 : 8 : 2 : 9 : 5 : \

b :list int
 list(4 1 2 10 5 20) # sugar ?

t :int # target
 24

solution :list (pair int int)
 fmin , cartesian a b

cartesian x:list int y:list int :list pair int int
 go x y

 go η:list int μ:list int :list pair int int
 η\ \ # inline result
 η(x : xx) μ\ go xx y
 η(x : xx) μ(y : yy) :pair x y : go η yy

fmin l:list (pair int int) :list (pair int int)
 go \ max_bound l

 go acc:list (pair int int) n:int l:list (pair int int)
 l\ acc
 l(:pair a x : as)
  x < n ? go (a : \)   x as ,
  x = n ? go (a : acc) n as ,
          go      acc  n as
