pub fn raindrops(num: u32) -> String {
    let mut output = String::new();

    if num % 3 == 0 { output.push_str("Pling") }
    if num % 5 == 0 { output.push_str("Plang") }
    if num % 7 == 0 { output.push_str("Plong") }

    if output.is_empty() {
        num.to_string()
    } else {
        output
    }
}
