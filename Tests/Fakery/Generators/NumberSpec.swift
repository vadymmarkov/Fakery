import Quick
import Nimble
@testable import Fakery

final class NumberSpec: QuickSpec {
  override func spec() {
    describe("Number") {
      var number: Faker.Number!

      beforeEach {
        number = Faker.Number()
      }

      it("creates contionusly increasing ids") {
        expect(number.increasingUniqueId()).to(equal(1))
        expect(number.increasingUniqueId()).to(equal(2))
        expect(number.increasingUniqueId()).to(equal(3))
      }

      it("creates random Ints") {
        expect(number.randomInt()) <= 1000
        expect(number.randomInt()) >= 0

        expect(number.randomInt(min: 10)) >= 10
        expect(number.randomInt(max: 10)) <= 10

        expect(number.randomInt(min: 5, max: 7)) <= 7
        expect(number.randomInt(min: 5, max: 7)) >= 5

        expect(number.randomInt(min: 1000000000000, max: 9999999999999)) >= 1000000000000
        expect(number.randomInt(min: 1000000000000, max: 9999999999999)) <= 9999999999999

        expect(number.randomInt(min: Int.min, max: Int.max)) >= Int.min
        expect(number.randomInt(min: Int.min, max: Int.max)) <= Int.max

        expect(number.randomInt(min: Int.min, max: 0)) >= Int.min
        expect(number.randomInt(min: Int.min, max: 0)) <= 0

      }

      it("creates random Floats") {
        expect(number.randomFloat()) <= 1000
        expect(number.randomFloat()) >= 0

        expect(number.randomFloat(min: 10)) >= 10
        expect(number.randomFloat(max: 10)) <= 10

        expect(number.randomFloat(min: 5, max: 7)) <= 7
        expect(number.randomFloat(min: 5, max: 7)) >= 5
      }

      #if !os(Linux)
      it("creates random CGFloats") {
        expect(number.randomCGFloat()) <= 1000
        expect(number.randomCGFloat()) >= 0

        expect(number.randomCGFloat(min: 10)) >= 10
        expect(number.randomCGFloat(max: 10)) <= 10

        expect(number.randomCGFloat(min: 5, max: 7)) <= 7
        expect(number.randomCGFloat(min: 5, max: 7)) >= 5
      }
      #endif

      it("creates random Doubles") {
        expect(number.randomDouble()) <= 1000
        expect(number.randomDouble()) >= 0

        expect(number.randomDouble(min: 10)) >= 10
        expect(number.randomDouble(max: 10)) <= 10

        expect(number.randomDouble(min: 5, max: 7)) <= 7
        expect(number.randomDouble(min: 5, max: 7)) >= 5
      }
    }
  }
}
