import Foundation
import Quick
import Nimble

class AddressSpec: QuickSpec
{
    override func spec()
    {
        describe("Address") {
            beforeEach {
                Generator.sharedInstance.locale = "en-TEST"
            }

            describe("#city") {
                it("returns the correct text") {
                    let city = Address.city()
                    expect(city).to(equal("North Vadymtown"))
                }
            }
        }
    }
}
