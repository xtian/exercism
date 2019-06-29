struct GradeSchool {
    private(set) var roster = [Int: [String]]()

    var sortedRoster: [Int: [String]] {
        return roster.mapValues { $0.sorted(by: <) }
    }

    mutating func addStudent(_ name: String, grade: Int) {
        roster[grade, default: []].append(name)
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade, default: []]
    }
}
