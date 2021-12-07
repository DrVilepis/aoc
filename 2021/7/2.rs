fn main() {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).unwrap();
    let mut input = input.trim().split(',').map(|n| n.parse::<i32>().unwrap()).collect::<Vec<_>>();
    let n = (1..1000).map(|i| {
        input.clone().iter().map(|j| {
            let n = (i-j).abs();
            n*(n+1)/2
        }).sum::<i32>()
    });
    println!("{}",n.min().unwrap());
}
