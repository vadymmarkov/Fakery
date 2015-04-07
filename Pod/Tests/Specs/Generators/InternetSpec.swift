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
                it("returns the correct text without separator by default") {
                    let username = internet.username()
                    expect(username).to(match("^[A-Za-z]+(\\d+)?$"))
                }

                it("returns the correct text with provided separator") {
                    let username = internet.username(separator: "_")
                    if countElements(username) > 5 {
                        expect(find(username, "_")).notTo(beNil())
                    } else {
                        expect(find(username, "_")).to(beNil())
                    }
                }

                it("doesn't have the ' symbol in the result") {
                    let username = internet.username(separator: "'_'")
                    expect(find(username, "'")).to(beNil())
                }
            }
        }
    }
}
