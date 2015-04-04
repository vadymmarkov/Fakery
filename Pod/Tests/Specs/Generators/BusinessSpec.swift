import Quick
import Nimble

class BusinessSpec: QuickSpec
{
    override func spec()
    {
        describe("Business") {
            var business: Business!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                business = Business(parser: parser)
            }

            describe("#creditCardNumber") {
                it("returns the correct text") {
                    let creditCardNumber = business.creditCardNumber()
                    expect(creditCardNumber).to(equal("1234-2121-1221-1211"))
                }
            }
        }
    }
}
