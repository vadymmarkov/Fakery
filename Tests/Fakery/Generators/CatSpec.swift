import Quick
import Nimble
@testable import Fakery

final class CatSpec: QuickSpec {
  override func spec() {
    describe("Cat") {
      var cat: Faker.Cat!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        cat = Faker.Cat(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = cat.name()
          expect(name).to(equal("Shadow"))
        }
      }

      describe("#breed") {
        it("returns the correct text") {
          let breed = cat.breed()
          expect(breed).to(equal("British Semipi-longhair"))
        }
      }

      describe("#registry") {
        it("returns the correct text") {
          let registry = cat.registry()
          expect(registry).to(equal("American Cat Fanciers Association"))
        }
      }
    }
  }
}
