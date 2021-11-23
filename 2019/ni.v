'this is a comment
 multiline

'type delarations

:will a
 none
 some a

:list a
 null
 node a (list a)

'class declaration

Functor f
 map f:fn a b x:f a :f b

'class instances

Functor will
 map a b f:fn a b w:will a :will b
 w:none :none
 w:some x :some (f x)

Functor list
 map a b f:fn a b l:list a :list b
 l:null :null
 l:node x tail :node (f x) (map f tail)

               ^ ambiguous if body doesnt start with ":"

not p:bool :bool
p:true :fals
p:fals :true

and p:bool q:bool :bool
p:true q
 :fals

or p:bool q:bool :bool
p:fals q
 :true

xor p:bool q:bool :bool
p:fals q
q:fals p
 :fals

nand p:bool q:bool :bool
 not , and p q

nand :fn bool bool bool
 not . and
