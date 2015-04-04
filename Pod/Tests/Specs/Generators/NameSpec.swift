import Quick
import Nimble

class NameSpec: QuickSpec
{
    override func spec()
    {
        describe("Name") {
            var name: Name!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                name = Name(parser: parser)
            }

            describe("#name") {
                it("returns the correct text") {
                    let text = name.name()
                    expect(text).to(equal("Mr. Vadym Markov"))
                }
            }

            describe("#firstName") {
                it("returns the correct text") {
                    let firstName = name.firstName()
                    expect(firstName).to(equal("Vadym"))
                }
            }

            describe("#lastName") {
                it("returns the correct text") {
                    let lastName = name.lastName()
                    expect(lastName).to(equal("Markov"))
                }
            }

            describe("#prefix") {
                it("returns the correct text") {
                    let prefix = name.prefix()
                    expect(prefix).to(equal("Mr."))
                }
            }

            describe("#psuffix") {
                it("returns the correct text") {
                    let suffix = name.suffix()
                    expect(suffix).to(equal("I"))
                }
            }
        }
    }
}
