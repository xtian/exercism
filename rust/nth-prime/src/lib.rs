pub fn nth(n: u32) -> Result<u32, &'static str> {
    if n == 0 {
        return Err("Invalid input");
    }

    (2..).filter(|&x| is_prime(x))
        .nth((n - 1) as usize)
        .ok_or("Invalid input")
}

fn is_prime(candidate: u32) -> bool {
    !(2..).take_while(|n| n * n <= candidate).any(|n| candidate % n == 0)
}
