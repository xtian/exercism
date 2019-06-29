class ETL {
    static func transform(_ input: [Int: [String]]) -> [String: Int] {
        return input.reduce(into: [:]) { output, element in
            for value in element.value {
                output[value.lowercased()] = element.key
            }
        }
    }
}
