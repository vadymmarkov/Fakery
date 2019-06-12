import Quick
import Nimble
@testable import Fakery

final class CarSpec: QuickSpec {
  override func spec() {
    describe("Car") {
      var cars: Faker.Car!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        cars = Faker.Car(parser: parser)
      }

      describe("#brand") {
        it("returns the correct brand name text") {
          let name = cars.brand()
          expect(name).to(equal("BMW"))
        }
      }
    }
  }
}
