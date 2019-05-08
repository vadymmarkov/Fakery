import Quick
import Nimble
@testable import Fakery

final class VehicleSpec: QuickSpec {
  override func spec() {
    describe("Vehicle") {
      var vehicle: Vehicle!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        vehicle = Vehicle(parser: parser)
      }

      describe("#brand") {
        it("returns the correct brand") {
          let brand = vehicle.brand()
          expect(brand).to(equal("Volkswagen"))
        }
      }
    }
  }
}
