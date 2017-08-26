pub fn sum_of_multiples(max: u32, bases: &Vec<u32>) -> u32 {
    (1..max)
        .filter(|&n| bases.iter().any(|m| n % m == 0))
        .sum()
}
