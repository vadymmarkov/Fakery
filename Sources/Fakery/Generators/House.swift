extension Faker {
  public final class House: Generator {
    public func furniture() -> String {
      return generate("house.furniture")
    }

    public func room() -> String {
      return generate("house.room")
    }
  }
}
