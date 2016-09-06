pub fn reply(input: &str) -> &str {
    if input.is_empty() {
        "Fine. Be that way!"
    } else if input.ends_with("?") {
        "Sure."
    } else if is_shouting(input) {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}

fn is_shouting(input: &str) -> bool {
    !input.chars().any(char::is_lowercase)
}
