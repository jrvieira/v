#[derive(Debug)]

enum Bl {
    V,
    F
}

fn id<T>(a: T) -> T {
    a
}

fn nt(p: Bl) -> Bl {
    match p {
        Bl::V => Bl::F,
        _ => Bl::V
    }
}

fn nd(p: Bl, q: Bl) -> Bl {
    match p {
        Bl::V => q,
        _ => p
    }
}

fn ou(p: Bl, q: Bl) -> Bl {
    match p {
        Bl::F => q,
        _ => p
    }
}

fn main() {
    println!("{:?}", nt(Bl::F));
    println!("{:?}", nt(Bl::V));

    println!("{:?}", nd(Bl::F, Bl::F));
    println!("{:?}", nd(Bl::V, Bl::F));
    println!("{:?}", nd(Bl::F, Bl::V));
    println!("{:?}", nd(Bl::V, Bl::V));

    println!("{:?}", ou(Bl::F, Bl::F));
    println!("{:?}", ou(Bl::V, Bl::F));
    println!("{:?}", ou(Bl::F, Bl::V));
    println!("{:?}", ou(Bl::V, Bl::V));
}
