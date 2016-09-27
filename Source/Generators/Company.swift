import Foundation

open class Company: Generator {

  open func name() -> String {
    return generate("company.name")
  }

  open func suffix() -> String {
    return generate("company.suffix")
  }

  open func catchPhrase() -> String {
    return randomWordsFromKey("company.buzzwords")
  }

  open func bs() -> String {
    return randomWordsFromKey("company.bs")
  }

  open func logo() -> String {
    let number = Int(arc4random_uniform(13)) + 1
    return "http://pigment.github.io/fake-logos/logos/medium/color/\(number).png"
  }
}
