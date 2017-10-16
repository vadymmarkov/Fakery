import Quick
import Nimble
@testable import Fakery

final class BankSpec: QuickSpec {
  override func spec() {
    describe("Bank") {
      var bank: Bank!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        bank = Bank(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = bank.name()
          expect(name).to(equal("ABN AMRO CORPORATE FINANCE LIMITED"))
        }
      }

      describe("#swiftBic") {
        it("returns a valid BIC") {
          let swiftBic = bank.swiftBic()
          expect(swiftBic).to(equal("AAFMGB21"))
        }
      }

      describe("#bban") {
          it("returns a valid BBAN") {
              let bban = bank.bban()
              expect(bban).to(match("[A-Z]{4}\\d{10}"))
          }
      }

      describe("#iban") {
        it("returns a valid IBAN") {
          let iban = bank.iban()
          expect(iban).to(match("[A-Z]{2}\\d{2}[A-Z]{4}\\d{10}"))
        }
      }
    }
  }
}
