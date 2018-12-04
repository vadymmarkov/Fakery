import Foundation

@objc public final class Name: Generator {
  @objc public func name() -> String {
    return generate("name.name")
  }

  @objc public func firstName() -> String {
    return generate("name.first_name")
  }

  @objc public func lastName() -> String {
    return generate("name.last_name")
  }

  @objc public func prefix() -> String {
    return generate("name.prefix")
  }

  @objc public func suffix() -> String {
    return generate("name.suffix")
  }

  @objc public func title() -> String {
    return generate("name.title.descriptor") + " "
      + generate("name.title.level") + " "
      + generate("name.title.job")
  }
}
