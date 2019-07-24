import Foundation

extension Faker {
  public final class Hobbit: Generator {
    public func character() -> String {
      return generate("hobbit.character")
    }

    public func thorinsCompany() -> String {
      return generate("hobbit.thorins_company")
    }

    public func quote() -> String {
      return generate("hobbit.quote")
    }

    public func location() -> String {
      return generate("hobbit.location")
    }
  }
}
