[# TODO

 consider: if type constructors cant have single letter names
 there is no need for:
 func [a b c d]<- a:a b:b c:c d:d
 ...

 nor for shadowing when declaring a type:
 maybe a
  :nothing
  :just [a]<- cant shadow an existing type

 consider: parenthesise class constraints for clarity:
 range (Eq Ord a) from:a to:a :list a

 refused: remove : from function return type doesnt work:
 cons head:a tail:list a :list a <- : removing : would cause ambiguity
  :node head (tail)

 $ .t :some 7
 > (Num a) :will a
 
 refused: lowercase class names incompatible with:
 eq a <- is this a class or type declaration?
  ...

 note: homonym functions with different type signatures are allowed:
 # pow int -> int -> int and pow int -> double -> double
  are tow different functions
 pow x:int e:int :int
  e = 0 ? 1 , x * (pow 3 (e - 1))

 pow x:int x:double :double
  ...

]

# this is a comment

# this is a multiline comment
 ended by deindentation

 empty lines are permitted # and comments can be
  nested like this
  second level
 first level

# IMPORT
.i base

[# INCLUSIVE
.i data.array
 :array
 length
 elem
# EXCLUSIVE
.e data.arrow
 ->
]

# RUN
.r run
.r echo "ok"

#
 DEFINITIONS
 name [[constraint]* generic]* [arg:type]* :type
 [match]
  code
  [
  clause]*
 \n
#
 EXAMPLE
 g = generic type variable
 C = class constraint
 a = argument identifier
 t = argument type (possible a)
 r = return type

 fname g1 C1 C2 g2 a1:t1 a2:t2 :r
 [match] # matches can be nested
  result


id a a:a :a
 a

# INFIX AND SYNONYMS
 'f - infix f
 infix functions can be of the form
  '[letter]+
  [symbol] # requires .syn

.syn echo print
.syn 'if ?

range Eq Ord a from:a to:a :list a
 from = to ? \ ,
 from < to ? :list a (range (succ from) to) ,
 :list a (range (pred from) to)

.syn range ..

# comma (,) is equivalent to $ in haskell

run :io nil
 print , seven 'elem (1 .. 7) # :true

# TYPES

void

nil
 :nil

bool
 :true
 :false

will a
 :none
 :some a

what a b
 :this a
 :that b

pair a b
 :pair a b

list a
 :empty
 :node a (list a)

.syn ':node :
.syn :empty \ # nullary functions can also have symbol synonyms

# UNNAMED VARIABLES (_)

fst a p:pair a b :a
p:pair a _
 a

head a l:list a :will (list a)
l\
 :none
l(x : _)
 :some x

tail a l:list a :will (list a)
l\
 :none
l(_ : t)
 :some t

fibs :list int
 0 : 1 : zip_with + fibs (tail fibs)

# some more pattern matching and syntax
 'match -> irrefutable match # ex. x':just 1
 'arg -> evaluates strictly # ex. seq a b 'x:a y:b :b
 matches can be nested

# calculate the final direction after 2 turns
direction one:dir two:dir :dir
one:left
 two:right
  :front
 two:left
  :back
...

f a l:list a :text # list char ?
l '(x : xx : xs)
 "list: " ++ show l ++ "\n" ,
 "first: " ++ show x ,
 "second: " ++ show xx ,
 "rest: " ++ show xs

# clauses

fibs n:int :int
 go 0 1 n

 go 'a:int 'b:int n:int :int
  n = 0 ? a , go b (a + b) (n - 1)

if a p:bool x:a y:a :a
p:true
 x
p:false
 y

elem a el:a l:list a :bool
l\ # same as l:empty
 :false
l:(x : xs) # same as l:node x xs
 el = x ? :true , elem e xs

ordering
 :lt
 :eq
 :gt

Ord a
 max_bound :a
 min_bound :a
 succ x:a :a
 pred x:a :a
 lt x:a y:a :bool
 gt x:a y:a :bool
 compare x:a y:a :ordering
  x < y ? :lt ,
  x = y ? :eq ,
  :gt

.syn 'lt <
.syn 'gt >

zero x:int :bool
 x = 0

natural x:int :bool
 x > -1

test :bool
 7 'elem (1 : 2 : 3 : \) # :true

not b:bool
b:true
 :false
b:false
 :true

and p:bool q:bool :bool
 p ? q p
or p:bool q:bool :bool
 p ? p q

.syn 'and &
.syn 'or |

type a
 :data a
 :data' a

# CLASSES

Eq a
 eq x:a y:a :bool
  not , ineq x y
 ineq x:a y:a :bool
  not , eq x y

.syn 'eq =
.syn 'ineq !

# CLASS INSTANCE

Eq type
 eq x:type y:type :bool <- types needed because class can contain homonym functions that work differently for different types (ex: pow x:int y:double)
  x:data y:data
   :true
  x:data' y:data'
   :true
  _
   :false

# SUB-CLASS (a must be Eq before its Ord)
Ord Eq a
 ...

# RECORD-LIKE SYNTAX FOR TYPES

any
 :any get_any:bool

vehicle
 :moto (year:natural) (model:text) (engine:engine)
 :car
 year:natural ,
 model:text ,
 engine:engine
 :plane
  year:natural ,
  model:text ,
  engine:engine

# more fun

intersperse a i:a l:list a :list a
l\
 \
l(a : as)
 a : i : intersperse as

map a b
 :empty
 :node a b (map a b)

ix a m:map int a i:int :will a
m\
 :none
m(:node id el : as)
 i = id ? :some el , ix as
