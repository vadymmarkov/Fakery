import Quick
import Nimble
@testable import Fakery

final class GenderSpec: QuickSpec {
  override func spec() {
    describe("Gender") {
      var gender: Faker.Gender!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        gender = Faker.Gender(parser: parser)
      }

      describe("#type") {
        it("returns the correct text") {
          let type = gender.type()
          expect(type).to(equal("Non-binary"))
        }
      }

      describe("#binary_type") {
        it("returns the correct text") {
          let binaryType = gender.binaryType()
          expect(binaryType).to(equal("Male"))
        }
      }
    }
  }
}
