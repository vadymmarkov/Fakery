import Quick
import Nimble
@testable import Fakery

final class NameSpec: QuickSpec {
  override func spec() {
    describe("Name") {
      var name: Faker.Name!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        name = Faker.Name(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let text = name.name()
          expect(text).to(equal("Mr. Vadym Markov"))
        }
      }

      describe("#firstName") {
        it("returns the correct text") {
          let firstName = name.firstName()
          expect(firstName).to(equal("Vadym"))
        }
      }

      describe("#lastName") {
        it("returns the correct text") {
          let lastName = name.lastName()
          expect(lastName).to(equal("Markov"))
        }
      }

      describe("#prefix") {
        it("returns the correct text") {
          let prefix = name.prefix()
          expect(prefix).to(equal("Mr."))
        }
      }

      describe("#suffix") {
        it("returns the correct text") {
          let suffix = name.suffix()
          expect(suffix).to(equal("I"))
        }
      }

      describe("#title") {
        it("returns the correct text") {
          let title = name.title()
          expect(title).to(equal("Lead Mobility Engineer"))
        }
      }
    }
  }
}
