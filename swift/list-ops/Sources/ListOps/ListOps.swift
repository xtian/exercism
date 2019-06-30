func append<T>(_ left: [T], _ right: [T]) -> [T] {
    return left + right
}

func concat<T>(_ inputs: [T]...) -> [T] {
    return foldLeft(inputs, accumulated: [], combine: +)
}

func filter<T>(_ input: [T], predicate: (T) -> Bool) -> [T] {
    return foldLeft(input, accumulated: [], combine: ({ acc, el in
        predicate(el) ? acc + [el] : acc
    }))
}

func length<T>(_ input: [T]) -> Int {
    return foldLeft(input, accumulated: 0, combine: ({ acc, _ in acc + 1 }))
}

func map<T, U>(_ input: [T], _ mapper: (T) -> (U)) -> [U] {
    return foldLeft(input, accumulated: [], combine: ({ acc, el in acc + [mapper(el)] }))
}

func foldLeft<T, U>(_ input: [T], accumulated: U, combine: (U, T) -> (U)) -> U {
    if input.isEmpty {
        return accumulated
    } else {
        let accumulated = combine(accumulated, input[0])
        return foldLeft(Array(input[1...]), accumulated: accumulated, combine: combine)
    }
}

func foldRight<T, U>(_ input: [T], accumulated: U, combine: (T, U) -> (U)) -> U {
    if input.isEmpty {
        return accumulated
    } else {
        let length = input.count - 1
        let accumulated = combine(input[length], accumulated)
        return foldRight(Array(input[0 ..< length]), accumulated: accumulated, combine: combine)
    }
}

func reverse<T>(_ input: [T]) -> [T] {
    return foldRight(input, accumulated: [], combine: ({ el, acc in acc + [el] }))
}
