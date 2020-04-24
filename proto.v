will a
 :none
 :some a

list a
 :empty
 :node a (list a)

.syn ':node :

intersperse a el:a l:list a :list a
l\
 \
l(a : as) # l:node a as
 a : el : intersperse as # :node a :node el intersperse as

concat a x:list a y:list a :list a
x\
 y
x(a : as)
 a : concat as y

.syn 'concat ++

Semigroup a
 semop x:a y:a :a # associative binary operation
 
.syn 'semop <>

Monoid Semigroup a
 identity :a
 join m:list a :a
  foldr semop identity

Semigroup list a
 semop x:list a y:list a :list a
  x ++ y

Monoid list a
 identity :list a
  \ 

Functor f
 map a b f:fun a b x:f a :f b

Functor list a
 map a b f:fun a b l:list a :list b
 l\
  \
 l(a : as)
  f a : map f as

Functor will a
 map a b f:fun a b w:will a :will b
 w:none
  :none
 w:some x
  :some , f x

tree a
 :empty
 :node e (tree a) (tree a)

Functor tree a
 map a b f:fun a b t:tree a :tree b
 t:empty
  :empty
 t:node el a b
  :node (f el) (map f a) (map f b)
