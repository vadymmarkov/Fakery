import Darwin

public final class Bank: Generator {
  public func name() -> String {
    return generate("bank.name")
  }

  public func swiftBic() -> String {
    return generate("bank.swiftBic")
  }

  public func iban() -> String {
    let bankCountryCode: String = generate("bank.ibanDetails.bankCountryCode")
    let bankCountryString: String = numerify("##")
    let ibanLetterCode: String = letterify(generate("bank.ibanDetails.ibanLetterCode"))
    let iban: String  = numerify(generate("bank.ibanDetails.ibanDigits"))

    return bankCountryCode + bankCountryString + ibanLetterCode + iban
  }
}
