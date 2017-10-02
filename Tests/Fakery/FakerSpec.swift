import Quick
import Nimble
@testable import Fakery

final class FakerSpec: QuickSpec {
  override func spec() {
    describe("Faker") {
      var faker: Faker!

      beforeEach {
        faker = Faker()
      }

      describe("#init") {
        it("sets default values") {
          expect(faker.locale).to(equal(Config.defaultLocale))
          expect(faker.parser.locale).to(equal(Config.defaultLocale))

          expect(faker.address.parser).to(beIdenticalTo(faker.parser))
          expect(faker.app.parser).to(beIdenticalTo(faker.parser))
          expect(faker.business.parser).to(beIdenticalTo(faker.parser))
          expect(faker.commerce.parser).to(beIdenticalTo(faker.parser))
          expect(faker.internet.parser).to(beIdenticalTo(faker.parser))
          expect(faker.lorem.parser).to(beIdenticalTo(faker.parser))
          expect(faker.name.parser).to(beIdenticalTo(faker.parser))
          expect(faker.phoneNumber.parser).to(beIdenticalTo(faker.parser))
          expect(faker.team.parser).to(beIdenticalTo(faker.parser))
          expect(faker.bank.parser).to(beIdenticalTo(faker.parser))
        }
      }

      describe("#address") {
        it("should be accessible") {
          expect(faker.address).to(beAKindOf(Address))
        }
      }

      describe("#app") {
        it("should be accessible") {
          expect(faker.app).to(beAKindOf(App))
        }
      }

      describe("#business") {
        it("should be accessible") {
          expect(faker.business).to(beAKindOf(Business))
        }
      }

      describe("#commerce") {
        it("should be accessible") {
          expect(faker.commerce).to(beAKindOf(Commerce))
        }
      }

      describe("#internet") {
        it("should be accessible") {
          expect(faker.internet).to(beAKindOf(Internet))
        }
      }

      describe("#lorem") {
        it("should be accessible") {
          expect(faker.lorem).to(beAKindOf(Lorem))
        }
      }

      describe("#name") {
        it("should be accessible") {
          expect(faker.name).to(beAKindOf(Name))
        }
      }

      describe("#phoneNumber") {
        it("should be accessible") {
          expect(faker.phoneNumber).to(beAKindOf(PhoneNumber))
        }
      }

      describe("#team") {
        it("should be accessible") {
          expect(faker.team).to(beAKindOf(Team))
        }
      }

      describe("#bank") {
        it("should be accessible") {
          expect(faker.bank).to(beAKindOf(Bank))
        }
      }
    }
  }
}
