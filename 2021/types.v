:void

:unit
 unit

:self a
 self a

:bool
 true
 fals

:will a
 none
 some a

:pair a b
 pair a b

:what a b
 this a
 that b

:nat
 one
 suc :nat

:list a
 null
 node a :list a

 .s \ null
 .s   node

:tree a
 node a :will :tree a :will :tree a

:tree a
 leaf a
 node a :tree a :tree a

:tree a
 node a :list :tree a

:list
 \
 a   :list a

id a:a :a
 a



