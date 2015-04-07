import Quick
import Nimble

class FakerSpec: QuickSpec {

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
                }
            }
        }
    }
}
