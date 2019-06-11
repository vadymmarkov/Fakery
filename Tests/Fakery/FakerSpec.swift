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
          expect(faker.zelda.parser).to(beIdenticalTo(faker.parser))
          expect(faker.business.parser).to(beIdenticalTo(faker.parser))
          expect(faker.commerce.parser).to(beIdenticalTo(faker.parser))
          expect(faker.gender.parser).to(beIdenticalTo(faker.parser))
          expect(faker.internet.parser).to(beIdenticalTo(faker.parser))
          expect(faker.lorem.parser).to(beIdenticalTo(faker.parser))
          expect(faker.name.parser).to(beIdenticalTo(faker.parser))
          expect(faker.phoneNumber.parser).to(beIdenticalTo(faker.parser))
          expect(faker.team.parser).to(beIdenticalTo(faker.parser))
          expect(faker.bank.parser).to(beIdenticalTo(faker.parser))
          expect(faker.programmingLanguage.parser).to(beIdenticalTo(faker.parser))
          expect(faker.vehicle.parser).to(beIdenticalTo(faker.parser))
          expect(faker.ham.parser).to(beIdenticalTo(faker.parser))
          expect(faker.house.parser).to(beIdenticalTo(faker.parser))
        }
      }

      describe("#address") {
        it("should be accessible") {
          expect(faker.address).to(beAKindOf(Faker.Address.self))
        }
      }

      describe("#app") {
        it("should be accessible") {
          expect(faker.app).to(beAKindOf(Faker.App.self))
        }
      }

      describe("#zelda") {
        it("should be accessible") {
          expect(faker.zelda).to(beAKindOf(Faker.Zelda.self))
        }
      }

      describe("#business") {
        it("should be accessible") {
          expect(faker.business).to(beAKindOf(Faker.Business.self))
        }
      }

      describe("#commerce") {
        it("should be accessible") {
          expect(faker.commerce).to(beAKindOf(Faker.Commerce.self))
        }
      }

      describe("#gender") {
        it("should be accessible") {
          expect(faker.gender).to(beAKindOf(Faker.Gender.self))
        }
      }

      describe("#internet") {
        it("should be accessible") {
          expect(faker.internet).to(beAKindOf(Faker.Internet.self))
        }
      }

      describe("#lorem") {
        it("should be accessible") {
          expect(faker.lorem).to(beAKindOf(Faker.Lorem.self))
        }
      }

      describe("#name") {
        it("should be accessible") {
          expect(faker.name).to(beAKindOf(Faker.Name.self))
        }
      }

      describe("#phoneNumber") {
        it("should be accessible") {
          expect(faker.phoneNumber).to(beAKindOf(Faker.PhoneNumber.self))
        }
      }

      describe("#team") {
        it("should be accessible") {
          expect(faker.team).to(beAKindOf(Faker.Team.self))
        }
      }

      describe("#bank") {
        it("should be accessible") {
          expect(faker.bank).to(beAKindOf(Faker.Bank.self))
        }
      }

      describe("#programmingLanguage") {
        it("should be accessible") {
          expect(faker.programmingLanguage).to(beAKindOf(Faker.ProgrammingLanguage.self))
        }
      }

      describe("#house") {
        it("should be accessible") {
          expect(faker.house).to(beAKindOf(Faker.House.self))
        }
      }
    }
  }
}
