struct Triangle {
    let kind: String

    init(_ a: Double, _ b: Double, _ c: Double) {
        let sides = Set([a, b, c])

        if max(a, b, c) >= (a + b + c) - max(a, b, c) {
            kind = "ErrorKind"
        } else if sides.count == 1 {
            kind = "Equilateral"
        } else if sides.count == 2 {
            kind = "Isosceles"
        } else {
            kind = "Scalene"
        }
    }
}
