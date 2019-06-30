extension Array {
    func accumulate<T>(_ mapper: (Element) -> T) -> [T] {
        var output: [T] = []

        for element in self {
            output += [mapper(element)]
        }

        return output
    }
}
