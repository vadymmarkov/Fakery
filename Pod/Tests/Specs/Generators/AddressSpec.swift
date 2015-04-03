import Quick
import Nimble

class AddressSpec: QuickSpec
{
    override func spec()
    {
        describe("Address") {
            beforeEach {
                Parser.sharedInstance.locale = "en-TEST"
            }

            describe("#city") {
                it("returns the correct text") {
                    let city = Address.city()
                    expect(city).to(equal("North Vadymtown"))
                }
            }

            describe("#streetName") {
                it("returns the correct text") {
                    let streetName = Address.streetName()
                    expect(streetName).to(equal("Vadym Avenue"))
                }
            }
        }
    }
}
