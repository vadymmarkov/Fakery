public final class Name: Generator {
  public func name() -> String {
    return generate("name.name")
  }

  public func firstName() -> String {
    return generate("name.first_name")
  }

  public func lastName() -> String {
    return generate("name.last_name")
  }

  public func prefix() -> String {
    return generate("name.prefix")
  }

  public func suffix() -> String {
    return generate("name.suffix")
  }

  public func title() -> String {
    return generate("name.title.descriptor") + " "
      + generate("name.title.level") + " "
      + generate("name.title.job")
  }
}
