import Quick
import Nimble

class InternetSpec: QuickSpec {

    override func spec() {
        describe("Internet") {
            let emailFormat = "[\\w._%+-]+@[\\w.-]+\\.\\w{2,}"
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
                        if count(username) > 5 {
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

            describe("#email") {
                it("returns the correct email address") {
                    let email = internet.email()
                    expect(email).to(match(emailFormat))
                }
            }

            describe("#freeEmail") {
                it("returns the correct email address") {
                    let freeEmail = internet.freeEmail()
                    expect(freeEmail).to(match(emailFormat))
                    expect(freeEmail).to(match("^[\\w._%+-]+@gmail.com$"))
                }
            }

            describe("#safeEmail") {
                it("returns the correct email address") {
                    let safeEmail = internet.safeEmail()
                    expect(safeEmail).to(match(emailFormat))
                    expect(safeEmail).to(match("^[\\w._%+-]+@example.(org|com|net)$"))
                }
            }
        }
    }
}
