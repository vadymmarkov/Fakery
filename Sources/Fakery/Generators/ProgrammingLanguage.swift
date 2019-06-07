extension Faker {
  public final class ProgrammingLanguage: Generator {
    public func name() -> String {
      return generate("programming_language.name")
    }

    public func creator() -> String {
      return generate("programming_language.creator")
    }
  }
}
