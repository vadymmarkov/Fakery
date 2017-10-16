import Quick
import Nimble
@testable import Fakery

final class CompanySpec: QuickSpec {
  override func spec() {
    describe("Company") {
      var company: Company!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        company = Company(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = company.name()
          expect(name).to(equal("Markov Inc"))
        }
      }

      describe("#suffix") {
        it("returns the correct text") {
          let suffix = company.suffix()
          expect(suffix).to(equal("Inc"))
        }
      }

      describe("#catchPhrase") {
        it("generates random catch phrase") {
          let phrase = company.catchPhrase()
          expect(phrase).to(equal("Universal 24 hour software"))
        }
      }

      describe("#bs") {
        it("generates random BS") {
          let bs = company.bs()
          expect(bs).to(equal("implement innovative methodologies"))
        }
      }

      describe("#logo") {
        it("generates random logo") {
          let logo = company.logo()
          expect(logo).to(match("^https://pigment.github.io/fake-logos/logos/medium/color/\\d+.png$"))
        }
      }
    }
  }
}
