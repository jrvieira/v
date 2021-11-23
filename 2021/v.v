:void

:unit
 unit

:bool
 fals
 true

:will a
 none
 some a

:what a b
 this a
 that b

:list a
 null
 node a (list a)

id a a:a :a
 a

const a b x:a _:b :a
 x

:nat
 one
 suc :nat

:int
 nil
 pos :nat
 neg :nat

:fun a b
 }{ 'unknown

'pattern matching is king
'ghosting is illegal

.infix ap ,

ap f:fun a b x:a :b
 f x

.infix if ?

if p:bool then:a else:a :a
 p:true : then
 p:fals : else

not b:bool :bool
 b:true
  fals
 b:fals
  true

'now equivalent to

not b:bool :bool
 b ? false , true

xor p:bool q:bool :bool
 not p ? q ,
 not q ? p ,
 fals

concat x:list a y:list a :list a
 x:null
  y
 x:node a as
  node a , concat as y

intersperse e:a l:list a :list a
 l:null
  l
 l:node a null
  l
 l:node a as
  node a , node e , intersperse e as

map f:fun a b l:list a :list b
 l:null
  null
 l:node a as
 node (f a) , map f as

'equivalent

map f:fun a b l:list a :list b
 l = null ? null ,
 node (f a) , map f as

