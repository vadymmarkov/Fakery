open class Team: Generator {

  open func name() -> String {
    return generate("team.name")
  }

  open func creature() -> String {
    return generate("team.creature")
  }

  open func state() -> String {
    return generate("address.state").capitalized
  }
}
