import Foundation

extension Faker {
  public final class Gender: Generator {
    public func type() -> String {
      return generate("gender.type")
    }

    public func binaryType() -> String {
      return generate("gender.binary_type")
    }
  }
}
