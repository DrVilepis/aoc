fn main() {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).unwrap();
    let mut input = input.trim().split(',').map(|n| n.parse::<i32>().unwrap()).collect::<Vec<_>>();
    input.sort();
    let avg = input[input.len()/2];
    println!("{}",input.iter().map(|i| (i-avg).abs()).sum::<i32>());
}
