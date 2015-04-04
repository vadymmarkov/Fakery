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
        }
    }
}
