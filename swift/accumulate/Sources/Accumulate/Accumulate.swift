extension Array {
    func accumulate<T>(_ mapper: (Element) -> T) -> [T] {
        return map(mapper)
    }
}
