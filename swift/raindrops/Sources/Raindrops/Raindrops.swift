struct Raindrops {
  var sounds: String = ""

  init(_ count: Int) {
    if count % 3 == 0 {
      self.sounds += "Pling"
    }

    if count % 5 == 0 {
      self.sounds += "Plang"
    }

    if count % 7 == 0 {
      self.sounds += "Plong"
    }

    if self.sounds == "" {
      self.sounds = "\(count)"
    }
  }
}
