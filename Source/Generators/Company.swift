public class Company: Generator {

  public func name() -> String {
    return generate("company.name")
  }

  public func suffix() -> String {
    return generate("company.suffix")
  }

  public func catchPhrase() -> String {
    return randomWordsFromKey("company.buzzwords")
  }

  public func bs() -> String {
    return randomWordsFromKey("company.bs")
  }
}
