#![feature(stdin_forwarders)]
use std::io::stdin;
use std::vec::Vec;

fn main() {
    let mut stdin = stdin();
    let mut buffer = String::new();
    let mut nums: Vec<((usize, usize), (usize, usize))> = Vec::new();
    for line in stdin.lines() {
        let line = line.unwrap();
        let (start, end) = line.split_once(" -> ").unwrap();
        let (y1, x1) = start.split_once(",").unwrap();
        let (y2, x2) = end.split_once(",").unwrap();
        nums.push((
            (y1.parse::<usize>().unwrap(), x1.parse::<usize>().unwrap()),
            (y2.parse::<usize>().unwrap(), x2.parse::<usize>().unwrap()),
        ));
    }
    let mut xs = [[0u8; 1000]; 1000];
    for n in nums {
        if n.1.1 == n.0.1 {
            for x in (n.1.0.min(n.0.0))..=(n.0.0.max(n.1.0)) {
                xs[n.1.1][x] += 1;
            }
        } else if n.1.0 == n.0.0 {
            for y in (n.1.1.min(n.0.1))..=(n.0.1.max(n.1.1)) {
                xs[y][n.1.0] += 1;
            }
        } else {
            if (n.0.0 < n.1.0 && n.0.1 < n.1.1) || (n.0.0 > n.1.0 && n.0.1 > n.1.1) {
                for (x, y) in ((n.1.0.min(n.0.0))..=(n.0.0.max(n.1.0)))
                    .zip((n.1.1.min(n.0.1))..=(n.0.1.max(n.1.1)))
                {
                    xs[y][x] += 1;
                }
            } else {
                for (x, y) in ((n.1.0.min(n.0.0))..=(n.0.0.max(n.1.0)))
                    .zip(((n.1.1.min(n.0.1))..=(n.0.1.max(n.1.1))).rev())
                {
                    xs[y][x] += 1;
                }
            }
        }
    }
    println!(
        "{}",
        xs.iter()
            .map(|x| x.iter().fold(0u32, |n, i| {
                if i >= &2 {
                    n + 1
                } else {
                    n
                }
            }))
            .sum::<u32>()
    );
}
