pub fn build_proverb(input: Vec<&'static str>) -> String {
    let mut verses = input.iter()
        .zip(input.iter().skip(1))
        .map(|(a, b)| format!("For want of a {} the {} was lost.", a, b))
        .collect::<Vec<_>>();

    verses.push(last_line(input));
    verses.join("\n")
}

fn last_line(input: Vec<&'static str>) -> String {
    match input.len() {
        0 => String::new(),
        1 | 2 => format!("And all for the want of a {}.", input[0]),
        _ => format!(
            "And all for the want of a {}{} {}.",
            input[2],
            input[1],
            input[0]
        ),
    }
}
