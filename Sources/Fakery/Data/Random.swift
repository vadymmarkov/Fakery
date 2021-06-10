
import Foundation

public struct AnyRandomNumberGenerator: RandomNumberGenerator {
    var wrapped: RandomNumberGenerator

    public init<T: RandomNumberGenerator>(_ wrapped: T) {
        self.wrapped = wrapped
    }
    
    public mutating func next() -> UInt64 {
        wrapped.next()
    }
}
