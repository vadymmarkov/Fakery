extension Faker {
  public final class Ham: Generator {
    public func name() -> String {
      return generate("ham.name")
    }
  }
}
