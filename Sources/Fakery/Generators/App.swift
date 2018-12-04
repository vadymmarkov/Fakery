import Foundation

@objc public final class App: Generator {
  @objc public func name() -> String {
    return generate("app.name")
  }

  @objc public func version() -> String {
    return numerify(generate("app.version"))
  }

  @objc public func author() -> String {
    return generate("app.author")
  }
}
