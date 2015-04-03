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

            describe("filling") {
                describe("#numerify") {
                    it("replaces # with random numbers") {
                        let numerified = generator.numerify("12####")
                        expect(numerified.toInt()).notTo(beNil())
                        expect(find(numerified, "#")).to(beNil())
                    }
                }

                describe("letterify") {
                    it("replaces ? with random letters") {
                        let letterified = generator.letterify("This is awes?me")
                        expect(find(letterified, "?")).to(beNil())
                    }
                }

                describe("bothify") {
                    it("replaces # with random numbers and ? with random letters") {
                        let bothified = generator.bothify("#th of ?pril")
                        expect(find(bothified, "#")).to(beNil())
                        expect(find(bothified, "?")).to(beNil())
                    }
                }
            }
        }
    }
}
