import Darwin

public final class Bank: Generator {

    public func name() -> String {
        return generate("bank.name")
    }

    public func swiftBic() -> String {
        return generate("bank.swiftBic")
    }

    public func iban(bankCountryCode: String = "GB") -> String {

        var details = [
            "bankCountryCode": "NL",
            "ibanLetterCode": 4,
            "ibanDigits": 12
        ] as [String : Any]

//        var details = ibanDetails()//.find { |country|
            //country["bankCountryCode"] == bank_country_code.upcase
        //}
//        raise ArgumentError, "Could not find iban details for #{bankCountryCode}" unless details

        let rawBankCountryCode: String = details["bankCountryCode"] as! String
        let bankCountryCode: String = rawBankCountryCode + (1...2).map { _ in arc4random_uniform(10) }.map { String($0) }.joined()

        let rawIbanLetterCode: Int = details["ibanLetterCode"] as! Int
        let ibanLetterCode: String = (0...rawIbanLetterCode).map { _ in
            let unicode: UnicodeScalar = UnicodeScalar(65 + arc4random_uniform(26))!
            return String(unicode)
        }.joined()

        let rawIban: Int = details["ibanDigits"] as! Int
        let iban: String  = (1...rawIban).map { _ in arc4random_uniform(10) }.map { String($0) }.joined()

        return bankCountryCode + ibanLetterCode + iban
    }

    private func ibanDetails() -> String {
        return generate("bank.ibanDetails")
    }
}
