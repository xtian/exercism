func isIsogram(_ input: String) -> Bool {
    var unused = [Character: Bool]()

    return input.lowercased().filter { $0.isLetter }.reduce(true) { valid, char in
        valid && (unused.updateValue(false, forKey: char) ?? true)
    }
}
