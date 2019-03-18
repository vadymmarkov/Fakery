import Foundation

extension Array {
  func at(_ index: Int?) -> Element? {
    guard let index = index, index >= 0 && index < endIndex else {
      return nil
    }

    return self[index]
  }

  func random() -> Element? {
    // swiftlint:disable empty_count
    guard count > 0 else {
      return nil
    }
    #if swift(>=4.2)
      return self.randomElement()
    #else
     return self[Int(arc4random_uniform(UInt32(count)))]
    #endif
  }
}
