# this is a comment

# this is a multiline comment
 ended by an empty line

.i base # .import base
.i data.array
 :array
 length
 elem
.i data.arrow

.r run # .run the function run

# values
seven :int
 7

# comma (,) is equivalent to $ in haskell

run :io nil
 print , seven arr:elem (:array 1 .. 7) # :true
 
# types

void

nil
 :nil

bool
 :true
 :false

will A
 :none
 :some A

what A B
 :this A
 :that B

pair A B
 :pair A B

list A
 :empty
 :cons A (list A)

.syn : ':node

.syn \ :empty

fst p:pair A _ :A
p:pair a _
 a

zero x:int :bool
 x = 0

natural x:int :bool
 x > -1

head l:list A :will (list A)
l\
 :none
l(x : _)
 :some x

tail l:list A :will (list A)
l\
 :none
l(_ : t)
 :some t

fibs :list int
 0 : 1 : zip_with + fibs (tail fibs)

# some more pattern matching and syntax
 ~ makes the match irrefutable
 ^ evaluates strictly
 comma allows breaking code into new line

f l:list A :text # list char ?
l~(^x : xx : xs)
 "list: " ++ show l ++ "\n" , 
 "first: " ++ show x ,
 "second: " ++ show xx ,
 "rest: " ++ show xs

if p:bool x:A y:A :A
p:true
 x
p:false
 y

.syn ? 'if

elem el:A l:list A :bool
l\ # same as l:empty
 :false
l:(x : xs) # same as l:cons x xs
 el = x ? :true , elem e xs 

# more fun with guards

ordering
 :lt
 :eq
 :gt

order x:A y:a :ordering 
 x < y ? :lt ,
 x = y ? :eq ,
 :gt

# 'f = haskell `f`
test :bool
 7 'elem 1 : 2 : 3 : \ # :true

not b:bool
b:true
 :false
b:false
 :true

and p:bool q:bool :bool
 p ? q p
or p:bool q:bool :bool
 p ? p q

.syn & 'and
.syn | 'or

type A
 :data A
 :data' A

# classes
Eq A
 eq x:A y:A
  not , ineq x y
 ineq x:A y:A
  not , eq x y

.syn = 'eq
.syn ! 'ineq

# class instance
Eq type
 eq x y
  x:data y:data
   :true
  x:data' y:data'
   :true
  _ 
   :false

id a:A :A
 a

# record-like syntax for types

any
 :any getAny:bool

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

