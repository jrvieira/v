import random

proc zipf(word: uint16 = 0): uint16 =
 let key = random(27)
 if key == 0:
  result = word
 else:
  result = zipf(word + 1)

for i in 0..900000:
 echo zipf()
