import Foundation

extension Array {

  func at(index: Int?) -> Element? {
    guard let index = index where index >= 0 && index < endIndex else {
      return nil
    }

    return self[index]
  }

  func random() -> Element? {
    guard count > 0 else {
      return nil
    }

    return self[Int(arc4random_uniform(UInt32(count)))]
  }
}
