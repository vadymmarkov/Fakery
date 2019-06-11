import Quick
import Nimble
@testable import Fakery

final class VehicleSpec: QuickSpec {
  override func spec() {
    describe("Vehicle") {
      var vehicle: Faker.Vehicle!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        vehicle = Faker.Vehicle(parser: parser)
      }

      describe("#manufacture") {
        it("returns the correct manufacture") {
          let manufacture = vehicle.manufacture()
          expect(manufacture).to(equal("Volkswagen"))
        }
      }

      describe("#make") {
        it("returns the correct make") {
          let make = vehicle.make()
          expect(make).to(equal("BMW"))
        }
      }

      describe("#colors") {
        it("returns the correct color") {
          let color = vehicle.colors()
          expect(color).to(equal("Red"))
        }
      }
    }
  }
}
