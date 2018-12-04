import Foundation

@objc public final class Team: Generator {
  @objc public func name() -> String {
    return generate("team.name")
  }

  @objc public func creature() -> String {
    return generate("team.creature")
  }

  @objc public func state() -> String {
    return generate("address.state").capitalized
  }
}
