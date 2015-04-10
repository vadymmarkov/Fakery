import Quick
import Nimble

class InternetSpec: QuickSpec {

    override func spec() {
        describe("Internet") {
            var internet: Internet!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                internet = Internet(parser: parser)
            }

            describe("#username") {
                context("without separator - by default") {
                    it("returns the correct text") {
                        let username = internet.username()
                        expect(username).to(match("^[A-Za-z]+(\\d+)?$"))
                    }
                }

                context("with provided separator") {
                    it("returns the correct text") {
                        let username = internet.username(separator: "_")
                        if countElements(username) > 5 {
                            expect(find(username, "_")).notTo(beNil())
                        } else {
                            expect(find(username, "_")).to(beNil())
                        }
                    }
                }

                it("doesn't have the ' symbol in the result") {
                    let username = internet.username(separator: "'_'")
                    expect(find(username, "'")).to(beNil())
                }
            }

            describe("#domainName") {
                it("returns the correct text") {
                    let domainName = internet.domainName()
                    expect(domainName).to(equal("markov.com"))
                }
            }

            describe("#domainWord") {
                it("returns the correct text") {
                    let domainWord = internet.domainWord()
                    expect(domainWord).to(equal("markov"))
                }
            }

            describe("#domainSuffix") {
                it("returns the correct text") {
                    let domainSuffix = internet.domainSuffix()
                    expect(domainSuffix).to(equal("com"))
                }
            }
        }
    }
}
