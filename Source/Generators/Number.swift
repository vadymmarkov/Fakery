import Foundation
import CoreGraphics

public class Number {

  private var lastUsedId: Int64 = 0

  public func randomBool() -> Bool {
    return randomInt() % 2 == 0
  }

  public func randomInt(min min: Int = 0, max: Int = 1000) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
  }

  public func randomFloat(min min: Float = 0, max: Float = 1000) -> Float {
    return (Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
  }

  public func randomCGFloat(min min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
    return CGFloat(Float(arc4random()) / Float(UInt32.max)) * (max - min) + min
  }

  public func randomDouble(min min: Double = 0, max: Double = 1000) -> Double {
    return (Double(arc4random()) / Double(UInt32.max)) * (max - min) + min
  }

  public func increasingUniqueId() -> Int {
    OSAtomicIncrement64(&lastUsedId)
    return Int(lastUsedId)
  }
}
