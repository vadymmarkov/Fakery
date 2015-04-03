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

            describe(".buildingNumber") {
                it("returns the correct text") {
                    let buildingNumber = Address.buildingNumber()
                    expect(buildingNumber).to(match("^\\d{5}$"))
                }
            }

            describe(".postcode") {
                context("without the state abbreviation") {
                    it("returns the correct text") {
                        let postcode = Address.postcode()
                        expect(postcode).to(match("^\\d{5}-\\d{4}$"))
                    }
                }

                context("with the state abbreviation") {
                    it("returns the correct text") {
                        let postcode = Address.postcode(stateAbbreviation: "CA")
                        expect(postcode).to(match("^900\\d{2}$"))
                    }
                }

                context("with the wrong state abbreviation") {
                    it("returns the correct text") {
                        let postcode = Address.postcode(stateAbbreviation: "TE")
                        expect(postcode).to(beEmpty())
                    }
                }
            }
        }
    }
}
