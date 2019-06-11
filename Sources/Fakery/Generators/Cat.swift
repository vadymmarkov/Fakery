import Foundation

extension Faker {
  public final class Cat: Generator {
    public func name() -> String {
      return generate("cat.name")
    }

    public func breed() -> String {
      return generate("cat.breed")
    }

    public func registry() -> String {
      return generate("cat.registry")
    }
  }
}
