import Quick
import Nimble
import SwiftyJSON

class ParserSpec: QuickSpec
{
    override func spec()
    {
        describe("Parser") {
            var parser: Parser!

            beforeEach {
                parser = Parser()
            }

            describe("#sharedInstance") {
                it("is initialized") {
                    expect(Parser.sharedInstance).notTo(beNil())
                }

                it("is the same") {
                    expect(Parser.sharedInstance).to(beIdenticalTo(Parser.sharedInstance))
                }

                it("is separate from unique instance") {
                    expect(Parser.sharedInstance).notTo(beIdenticalTo(Parser()))
                }
            }

            describe("#init") {
                it("creates unique instances") {
                    expect(Parser()).notTo(beIdenticalTo(Parser()))
                }

                it("sets default values") {
                    expect(parser.locale).to(equal(Config.defaultLocale))
                    expect(parser.dataProvider).notTo(beNil())
                }
            }

            describe("parsing") {
                beforeEach {
                    parser.locale = "en-TEST"
                }

                describe("#parseKey") {
                    context("when the key is correct") {
                        it("returns the correct text") {
                            let city = parser.parseKey("address.city")
                            expect(city).to(equal("North Vadymtown"))

                            let name = parser.parseKey("name.name")
                            expect(name).to(equal("Mr. Vadym Markov"))

                            let team = parser.parseKey("team.name")
                            expect(team).to(equal("California owls"))
                        }
                    }

                    context("when the key is incorrect") {
                        it("returns the empty text") {
                            let dummy = parser.parseKey("dummy")
                            expect(dummy).to(equal(""))
                        }
                    }
                }

                describe("parseTemplate:withCurrentSubject") {
                    context("when the subject are correct") {
                        it("returns the correct text") {
                            let text = parser.parseTemplate("#{Name.first_name} #{street_suffix} Test", withCurrentSubject: "address")
                            expect(text).to(equal("Vadym Avenue Test"))
                        }
                    }

                    context("when the subject is incorrect") {
                        it("returns the passed text") {
                            let text = parser.parseTemplate("test", withCurrentSubject: "test")
                            expect(text).to(equal("test"))

                            let text1 = parser.parseTemplate("test", withCurrentSubject: "address")
                            expect(text1).to(equal("test"))
                        }
                    }
                }
            }
        }
    }
}
