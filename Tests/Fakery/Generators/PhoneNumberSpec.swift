import Quick
import Nimble
@testable import Fakery

final class PhoneNumberSpec: QuickSpec {
  override func spec() {
    describe("PhoneNumber") {
      var phoneNumber: PhoneNumber!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        phoneNumber = PhoneNumber(parser: parser)
      }

      describe("#phoneNumber") {
        it("generates the correct text") {
          let phone = phoneNumber.phoneNumber()
          expect(phone).to(match("^\\d{3}-\\d{3}-\\d{4}$"))
        }
      }

      describe("#cellPhone") {
        it("generates the correct text") {
          let phone = phoneNumber.cellPhone()
          expect(phone).to(match("^\\(\\d{3}\\) \\d{3}-\\d{4}$"))
        }
      }

      describe("#areaCode") {
        it("generates the correct text") {
          let areaCode = phoneNumber.areaCode()
          expect(areaCode).to(equal("201"))
        }
      }

      describe("#exchangeCode") {
        it("generates the correct text") {
          let exchangeCode = phoneNumber.exchangeCode()
          expect(exchangeCode).to(equal("201"))
        }
      }

      describe("#subscriberNumber") {
        it("generates the correct number with 4 digits") {
          let subscriberNumber = phoneNumber.subscriberNumber()
          expect(subscriberNumber).to(match("^\\d{4}$"))
        }
      }

      describe("#numberExtension") {
        it("generates the correct text with specified number of digits") {
          let numberExtension = phoneNumber.numberExtension(5)
          expect(numberExtension).to(match("^\\d{5}$"))
        }
      }
    }
  }
}
