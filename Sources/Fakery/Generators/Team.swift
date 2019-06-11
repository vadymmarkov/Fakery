extension Faker {
  public final class Team: Generator {
    public func name() -> String {
      return generate("team.name")
    }

    public func creature() -> String {
      return generate("team.creature")
    }

    public func state() -> String {
      return generate("address.state").capitalized
    }
  }
}
