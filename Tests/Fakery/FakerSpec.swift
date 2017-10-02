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
        }
      }
    }
  }
}
