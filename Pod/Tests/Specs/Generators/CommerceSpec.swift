import Quick
import Nimble

class CommerceSpec: QuickSpec
{
    override func spec()
    {
        describe("Commerce") {
            var commerce: Commerce!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                commerce = Commerce(parser: parser)
            }

            describe("#color") {
                it("returns the correct text") {
                    let color = commerce.color()
                    expect(color).to(equal("black"))
                }
            }
        }
    }
}
