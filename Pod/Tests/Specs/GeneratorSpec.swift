import Foundation
import Quick
import Nimble
import SwiftyJSON

class GeneratorSpec: QuickSpec
{
    override func spec()
    {
        describe("Generator") {
            var generator: Generator!

            beforeEach {
                generator = Generator()
            }

            describe("#sharedInstance") {
                it("is initialized") {
                    expect(Generator.sharedInstance).notTo(beNil())
                }

                it("is the same") {
                    expect(Generator.sharedInstance).to(beIdenticalTo(Generator.sharedInstance))
                }

                it("is separate from unique instance") {
                    expect(Generator.sharedInstance).notTo(beIdenticalTo(Generator()))
                }
            }

            describe("#init") {
                it("creates unique instances") {
                    expect(Generator()).notTo(beIdenticalTo(Generator()))
                }

                it("sets default values") {
                    expect(generator.locale).to(equal(Config.defaultLocale))
                    expect(generator.dataProvider).notTo(beNil())
                }
            }
        }
    }
}
