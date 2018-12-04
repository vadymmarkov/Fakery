import Foundation

@objc public final class Company: Generator {
  @objc public func name() -> String {
    return generate("company.name")
  }

  @objc public func suffix() -> String {
    return generate("company.suffix")
  }

  @objc public func catchPhrase() -> String {
    return randomWordsFromKey("company.buzzwords")
  }

  @objc public func bs() -> String {
    return randomWordsFromKey("company.bs")
  }

  @objc public func logo() -> String {
    let number = Int(arc4random_uniform(13)) + 1
    return "https://pigment.github.io/fake-logos/logos/medium/color/\(number).png"
  }
}
