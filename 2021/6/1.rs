fn main() {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input);
    let mut input = input.trim().split(',').map(|num| num.parse::<usize>().unwrap()).collect::<Vec<_>>();
    let mut fish = [0u64;9];
    for i in input {
        fish[i] += 1;
    }
    for _ in 0..80 {
        let tmp = fish[0];
        for i in 0..8usize {
            fish[i] = fish[i+1];
        }
        fish[8] = tmp;
        fish[6] += tmp;
    }
    println!("{}",fish.iter().sum::<u64>());
}
