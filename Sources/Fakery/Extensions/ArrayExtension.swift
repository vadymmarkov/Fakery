import Foundation

extension Array {
  func at(_ index: Int?) -> Element? {
    guard let index = index, index >= 0 && index < endIndex else {
      return nil
    }

    return self[index]
  }

    func random<T: RandomNumberGenerator>(using generator: inout T) -> Element? {
    // swiftlint:disable empty_count
    guard count > 0 else {
      return nil
    }
    #if swift(>=4.2)
      return self.randomElement(using: &generator)
    #else
      return self[Int.random(in: 0..<count, using: &generator)]
    #endif
  }
}
