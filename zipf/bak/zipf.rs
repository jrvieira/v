extern crate rand;

use rand::distributions::{Distribution, Uniform};

fn main() {

 let mut rng = rand::thread_rng();
 let ran: u8 = Uniform::from(0..27);
 let mut key;

 for _ in 0..900000  {
  key = ran.sample(&mut rng);
  print!("{}", zipf(0, r));
 }

}

fn zipf(word: u32, r: u8) -> u32 {

 if key == 0 { word } else { zipf(word + 1) }

}

