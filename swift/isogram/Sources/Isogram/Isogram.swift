func isIsogram(_ input: String) -> Bool {
    let letters = input.lowercased().filter { $0.isLetter }
    return Set(letters).count == letters.count
}
