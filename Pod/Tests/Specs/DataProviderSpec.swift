import Quick
import Nimble

class DataProviderSpec: QuickSpec
{
    override func spec()
    {
        describe("DataProvider") {
            var dataProvider: DataProvider!

            beforeEach {
                dataProvider = DataProvider()
            }

            describe("#init") {
                it ("is initialized") {
                    expect(dataProvider).notTo(beNil())
                }

                it("creates unique instances") {
                    expect(DataProvider()).notTo(beIdenticalTo(DataProvider()))
                }

                it ("has empty translations dictionary") {
                    expect(dataProvider.translations).notTo(beNil())
                    expect(dataProvider.translations.count).to(equal(0))
                }
            }

            describe("#dataForLocale") {
                it ("returns data if locale file exists") {
                    expect(dataProvider.dataForLocale("en")).notTo(beNil())
                }

                it ("returns nil if locale file doesn't exist") {
                    expect(dataProvider.dataForLocale("bla")).to(beNil())
                }
            }
        }
    }
}
