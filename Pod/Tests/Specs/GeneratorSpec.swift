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

            describe("parsing") {
                beforeEach {
                    generator.locale = "en-TEST"
                }

                describe("#parseKey") {
                    context("when the key is correct") {
                        it("returns the correct text") {
                            let city = generator.parseKey("address.city")
                            expect(city).to(equal("North Vadymtown"))

                            let name = generator.parseKey("name.name")
                            expect(name).to(equal("Mr. Vadym Markov"))

                            let team = generator.parseKey("team.name")
                            expect(team).to(equal("California owls"))
                        }
                    }

                    context("when the key is incorrect") {
                        it("returns the empty text") {
                            let dummy = generator.parseKey("dummy")
                            expect(dummy).to(equal(""))
                        }
                    }
                }

                describe("parseTemplate:withCurrentSubject") {
                    context("when the subject are correct") {
                        it("returns the correct text") {
                            let text = generator.parseTemplate("#{Name.first_name} #{street_suffix} Test", withCurrentSubject: "address")
                            expect(text).to(equal("Vadym Avenue Test"))
                        }
                    }

                    context("when the subject is incorrect") {
                        it("returns the passed text") {
                            let text = generator.parseTemplate("test", withCurrentSubject: "test")
                            expect(text).to(equal("test"))

                            let text1 = generator.parseTemplate("test", withCurrentSubject: "address")
                            expect(text1).to(equal("test"))
                        }
                    }
                }
            }
        }
    }
}
