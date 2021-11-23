extern crate rand;

use rand::distributions::{Distribution, Uniform};

fn main() {

 for _ in 0..900000  {
  println!("{}", zipf(0))
 }

}

fn zipf(word: u16) -> u16 {

 let mut rng = rand::thread_rng();
 let key = Uniform::from(0..27);

 if key.sample(&mut rng) == 0 { word } else { zipf(word + 1) }

}

