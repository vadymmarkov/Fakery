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

            describe(".timeZone") {
                it("returns the correct text") {
                    let timeZone = Address.timeZone()
                    expect(timeZone).to(equal("America/Los_Angeles"))
                }
            }

            describe(".streetSuffix") {
                it("returns the correct text") {
                    let streetSuffix = Address.streetSuffix()
                    expect(streetSuffix).to(equal("Avenue"))
                }
            }

            describe(".citySuffix") {
                it("returns the correct text") {
                    let citySuffix = Address.citySuffix()
                    expect(citySuffix).to(equal("town"))
                }
            }

            describe(".cityPrefix") {
                it("returns the correct text") {
                    let cityPrefix = Address.cityPrefix()
                    expect(cityPrefix).to(equal("North"))
                }
            }

            describe(".stateAbbreviation") {
                it("returns the correct text") {
                    let stateAbbreviation = Address.stateAbbreviation()
                    expect(stateAbbreviation).to(equal("CA"))
                }
            }

            describe(".state") {
                it("returns the correct text") {
                    let state = Address.state()
                    expect(state).to(equal("California"))
                }
            }

            describe(".country") {
                it("returns the correct text") {
                    let country = Address.country()
                    expect(country).to(equal("United States of America"))
                }
            }

            describe(".countryCode") {
                it("returns the correct text") {
                    let countryCode = Address.countryCode()
                    expect(countryCode).to(equal("US"))
                }
            }
        }
    }
}
