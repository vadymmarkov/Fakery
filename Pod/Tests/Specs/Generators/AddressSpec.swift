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

            describe(".city") {
                it("returns the correct text") {
                    let city = Address.city()
                    expect(city).to(equal("North Vadymtown"))
                }
            }

            describe(".streetName") {
                it("returns the correct text") {
                    let streetName = Address.streetName()
                    expect(streetName).to(equal("Vadym Avenue"))
                }
            }

            describe(".secondaryAddress") {
                it("returns the correct text") {
                    let secondaryAddress = Address.secondaryAddress()
                    expect(secondaryAddress).to(match("^Apt. \\d{3}$"))
                }
            }

            describe(".streetAddress") {
                context("without secondary") {
                    it("returns the correct text") {
                        let streetAddress = Address.streetAddress()
                        expect(streetAddress).to(match("^\\d{5} Vadym Avenue$"))
                    }
                }

                context("include secondary") {
                    it("returns the correct text") {
                        let streetAddress = Address.streetAddress(includeSecondary: true)
                        expect(streetAddress).to(match("^\\d{5} Vadym Avenue Apt. \\d{3}$"))
                    }
                }
            }
        }
    }
}
