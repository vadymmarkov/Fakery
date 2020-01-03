import Foundation

extension String {
  static func characters(amount: Int = 255) -> String {
    var chars = ""

    if amount > 0 {
      for _ in 0..<amount {
        #if swift(>=4.2)
        let char = Character(UnicodeScalar(Int.random(in: 0..<Int.max) % (122 - 97) + 97)!)
        #else
        let char = Character(UnicodeScalar(arc4random() % (122-97) + 97)!)
        #endif
        chars.append(char)
      }
    }

    return chars
  }
}
