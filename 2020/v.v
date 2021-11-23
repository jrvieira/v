# this program prints
  10 random word lengths

:i random # import

run :io void
  map echo , replicate 10 (zipf seed) # first line is main

zipf s:io seed :int
  go 0

  go word:int :int
    random s 27 = 0 ? word , go (succ word)


# basic types

void

unit
  :unit

bool
  :true
  :fals

will a
  :none
  :some a

list a
  :null
  :node a (list a)

what a b
  :this a
  :that b

:syn : ':node

intersperse a el:a l:list a :list a
l:null :null
l:(a : as) a : el : intersperse as

:syn \ :null

concat x:list a y:list a :list a
x\ y
x(a : as) a : concat as y

Semigtoup a
  semop x:a y:a :a

Monoid Semigroup a
  identity :a
  join m:list a :a
    semop identity

:syn <> semop
:syn 

