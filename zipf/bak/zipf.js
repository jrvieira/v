function zipf (word = 0) {
 let key = Math.floor(Math.random()*27)
 return key ? zipf(++word) : word
}

let i = 900000
while (i--) console.log(zipf())
