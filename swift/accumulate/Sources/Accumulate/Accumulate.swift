extension Array {
  func accumulate<T>(_ mapper: (Element) -> T) -> [T] {
    return self.map(mapper)
  }
}
