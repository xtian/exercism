public struct DNA {
  let strand: String
  let nucleotides: [Character] = ["A", "T", "C", "G"]

  init?(strand: String) {
    self.strand = strand

    if !strand.allSatisfy({ self.nucleotides.contains($0) }) {
      return nil
    }
  }

  func count(_ input: Character) -> Int {
    return self.strand.reduce(0, { count, char in
      if char == input { return count + 1 }
      return count
    })
  }

  func counts() -> [String : Int] {
    var output = [String : Int]()

    for char in self.nucleotides {
      output["\(char)"] = count(char)
    }

    return output
  }
}
