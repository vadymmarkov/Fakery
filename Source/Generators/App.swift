public final class App: Generator {
  public func name() -> String {
    return generate("app.name")
  }

  public func version() -> String {
    return numerify(generate("app.version"))
  }

  public func author() -> String {
    return generate("app.author")
  }
}
