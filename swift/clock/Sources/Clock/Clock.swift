struct Clock: Equatable {
    private let minutes: Int

    init(hours: Int, minutes: Int = 0) {
        let oneDay = 24 * 60
        self.minutes = (oneDay + (hours * 60 + minutes) % oneDay) % oneDay
    }

    func add(minutes: Int) -> Clock {
        return Clock(hours: 0, minutes: self.minutes + minutes)
    }

    func subtract(minutes: Int) -> Clock {
        return Clock(hours: 0, minutes: self.minutes - minutes)
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        return "\(Clock.pad(minutes / 60)):\(Clock.pad(minutes % 60))"
    }

    private static func pad(_ input: Int) -> String {
        return String("0\(input)".suffix(2))
    }
}
