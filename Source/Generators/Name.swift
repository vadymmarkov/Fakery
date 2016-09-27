open class Name: Generator {

  open func name() -> String {
    return generate("name.name")
  }

  open func firstName() -> String {
    return generate("name.first_name")
  }

  open func lastName() -> String {
    return generate("name.last_name")
  }

  open func prefix() -> String {
    return generate("name.prefix")
  }

  open func suffix() -> String {
    return generate("name.suffix")
  }

  open func title() -> String {
    return generate("name.title.descriptor") + " "
      + generate("name.title.level") + " "
      + generate("name.title.job")
  }
}
