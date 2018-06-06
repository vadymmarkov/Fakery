import Foundation
#if !os(Linux)
import CoreGraphics
#endif

public final class Number {
	fileprivate var lastUsedId: Int = 0

	public func randomBool() -> Bool {
		return randomInt() % 2 == 0
	}

	public func randomInt(min: Int = 0, max: Int = 1000) -> Int {
		return Random.int(range: min...max)
	}

	public func randomFloat(min: Float = 0, max: Float = 1000) -> Float {
		return (Float(Random.int()) / Float(UInt32.max)) * (max - min) + min
	}

	#if !os(Linux)
	public func randomCGFloat(min: CGFloat = 0, max: CGFloat = 1000) -> CGFloat {
		return CGFloat(Float(Random.int()) / Float(UInt32.max)) * (max - min) + min
	}
	#endif

	public func randomDouble(min: Double = 0, max: Double = 1000) -> Double {
		let double = (Double(Random.int()) / Double(UInt32.max)) * (max - min) + min
		return double.rounded(toPlaces: 10)
	}

	public func increasingUniqueId() -> Int {
		lastUsedId += 1
		return lastUsedId
	}
}

fileprivate extension Double {
	/// Rounds the double to decimal places value
	fileprivate func rounded(toPlaces places:Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}
