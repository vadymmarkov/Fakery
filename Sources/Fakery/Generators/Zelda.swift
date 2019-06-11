extension Faker {
  public final class Zelda: Generator {
    public func game() -> String {
      return generate("zelda.game")
    }
  }
}
