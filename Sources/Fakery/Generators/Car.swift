import Foundation

extension Faker {
  public final class Car: Generator {
    public func brand() -> String {
      return generate("car.brand")
    }
  }
}
