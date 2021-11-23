void

unit :unit

bool :true :fals

will a :none :some a

list a :null :node a (list a)

what a b :this a :that b

intersperse a el:a l:list a :list a
l:null :null
l:(a : as) a : el : intersperse as

Functor f
 map a b f:fun a b x:f a :f b

Functor will a
 map a b f:fun a b w:will a :will b
 w:none :none
 w:some x :some , f x

Functor list a
 map a b f:fun a b l:list a :list b
 l:null :null
 l:node a as :node (f a) (map f as)

