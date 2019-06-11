import Foundation

extension Faker {
  public final class Company: Generator {
    public func name() -> String {
      return generate("company.name")
    }

    public func suffix() -> String {
      return generate("company.suffix")
    }

    public func catchPhrase() -> String {
      return randomWordsFromKey("company.buzzwords")
    }

    public func bs() -> String {
      return randomWordsFromKey("company.bs")
    }

    public func logo() -> String {
      #if swift(>=4.2)
      let number = Int.random(in: 0..<13) + 1
      #else
      let number = Int(arc4random_uniform(13)) + 1
      #endif
      return "https://pigment.github.io/fake-logos/logos/medium/color/\(number).png"
    }
  }
}
