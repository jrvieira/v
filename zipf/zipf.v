.i random

.run map echo , replicate 900000 (zipf seed)

zipf r:io seed :int
 go 0 r

 go word:int :int
  random r 27 = 0 ? word , go (succ word)

 
