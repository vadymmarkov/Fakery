extension Faker {
  public final class Vehicle: Generator {
    public func manufacture() -> String {
      return generate("vehicle.manufacture")
    }

    public func make() -> String {
      return generate("vehicle.makes")
    }

    public func colors() -> String {
      return generate("vehicle.colors")
    }
  }
}
