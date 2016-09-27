open class App: Generator {

  open func name() -> String {
    return generate("app.name")
  }

  open func version() -> String {
    return numerify(generate("app.version"))
  }

  open func author() -> String {
    return generate("app.author")
  }
}
