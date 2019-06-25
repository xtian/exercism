extension Array where Element : Any {
  func accumulate<T: Any>(_ mapper: (Element) -> T) -> [T] {
    return map { mapper($0) }
  }
}
