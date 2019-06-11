import Quick
import Nimble
@testable import Fakery

final class HouseSpec: QuickSpec {
  override func spec() {
    describe("House") {
      var house: Faker.House!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        house = Faker.House(parser: parser)
      }

      describe("#furniture") {
        it("returns the correct text") {
          let furniture = house.furniture()
          expect(furniture).to(equal("chair"))
        }
      }

      describe("#room") {
        it("returns the correct text") {
          let room = house.room()
          expect(room).to(equal("bedroom"))
        }
      }
    }
  }
}
