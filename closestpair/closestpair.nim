let a = [-1,3,8,2,9,5]
let b = [4,1,2,10,5,20]
let t = 24 # target

proc pairs(): array[a.len * b.len, (int,int)] =
 var n = 0
 for x in a:
  for y in b:
   result[n] = (x,y)
   inc n

proc fmin[N](arr: array[N,(int,int)]): seq[(int,int)] =
 var min = high(int)
 for p in arr:
  let s = abs(t - (p[0] + p[1]))
  if s < min:
   min = s
   result = @[p]
  elif s == min:
   result.add(p)

for p in fmin pairs():
 echo p
