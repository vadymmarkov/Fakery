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

            describe("#ipV4Address") {
                it("returns the correct text") {
                    let ipV4Address = internet.ipV4Address()
                    expect(ipV4Address).to(match("((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])"))
                }
            }

            describe("#ipV6Address") {
                it("returns the correct text") {
                    let ipV6Address = internet.ipV6Address()
                    expect(ipV6Address).to(match("^([0-9A-Fa-f]{0,4}:){2,7}([0-9A-Fa-f]{1,4}$|((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.|$)){4})"))
                }
            }
        }
    }
}
