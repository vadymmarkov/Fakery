import Quick
import Nimble
@testable import Fakery

final class AddressSpec: QuickSpec {
  override func spec() {
    describe("Address") {
      var address: Faker.Address!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        address = Faker.Address(parser: parser)
      }

      describe("#city") {
        it("returns the correct text") {
          let city = address.city()
          expect(city).to(equal("North Vadymtown"))
        }
      }

      describe("#streetName") {
        it("returns the correct text") {
          let streetName = address.streetName()
          expect(streetName).to(equal("Vadym Avenue"))
        }
      }

      describe("#secondaryAddress") {
        it("returns the correct text") {
          let secondaryAddress = address.secondaryAddress()
          expect(secondaryAddress).to(match("^Apt. \\d{3}$"))
        }
      }

      describe("#streetAddress") {
        context("without secondary") {
          it("returns the correct text") {
            let streetAddress = address.streetAddress()
            expect(streetAddress).to(match("^\\d{5} Vadym Avenue$"))
          }
        }

        context("include secondary") {
          it("returns the correct text") {
            let streetAddress = address.streetAddress(includeSecondary: true)
            expect(streetAddress).to(match("^\\d{5} Vadym Avenue Apt. \\d{3}$"))
          }
        }
      }

      describe("#buildingNumber") {
        it("returns the correct text") {
          let buildingNumber = address.buildingNumber()
          expect(buildingNumber).to(match("^\\d{5}$"))
        }
      }

      describe("#postcode") {
        context("without the state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode()
            expect(postcode).to(match("^\\d{5}-\\d{4}$"))
          }
        }

        context("with the state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode(stateAbbreviation: "CA")
            expect(postcode).to(match("^900\\d{2}$"))
          }
        }

        context("with the wrong state abbreviation") {
          it("returns the correct text") {
            let postcode = address.postcode(stateAbbreviation: "TE")
            expect(postcode).to(beEmpty())
          }
        }
      }

      describe("#timeZone") {
        it("returns the correct text") {
          let timeZone = address.timeZone()
          expect(timeZone).to(equal("America/Los_Angeles"))
        }
      }

      describe("#streetSuffix") {
        it("returns the correct text") {
          let streetSuffix = address.streetSuffix()
          expect(streetSuffix).to(equal("Avenue"))
        }
      }

      describe("#citySuffix") {
        it("returns the correct text") {
          let citySuffix = address.citySuffix()
          expect(citySuffix).to(equal("town"))
        }
      }

      describe("#cityPrefix") {
        it("returns the correct text") {
          let cityPrefix = address.cityPrefix()
          expect(cityPrefix).to(equal("North"))
        }
      }

      describe("#stateAbbreviation") {
        it("returns the correct text") {
          let stateAbbreviation = address.stateAbbreviation()
          expect(stateAbbreviation).to(equal("CA"))
        }
      }

      describe("#state") {
        it("returns the correct text") {
          let state = address.state()
          expect(state).to(equal("California"))
        }
      }

      describe("#county") {
        it("returns the correct text") {
          let country = address.county()
          expect(country).to(equal("Autauga County"))
        }
      }

      describe("#country") {
        it("returns the correct text") {
          let country = address.country()
          expect(country).to(equal("United States of America"))
        }
      }

      describe("#countryCode") {
        it("returns the correct text") {
          let countryCode = address.countryCode()
          expect(countryCode).to(equal("US"))
        }
      }

      describe("#latitude") {
        it("returns non-zero value") {
          let latitude = address.latitude()
          expect(latitude).notTo(equal(0))
        }
      }

      describe("#longitude") {
        it("returns non-zero value") {
          let longitude = address.longitude()
          expect(longitude).notTo(equal(0))
        }
      }
    }
  }
}
