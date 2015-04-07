import Quick
import Nimble

class PhoneNumberSpec: QuickSpec
{
    override func spec()
    {
        describe("PhoneNumber") {
            var phoneNumber: PhoneNumber!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                phoneNumber = PhoneNumber(parser: parser)
            }

            describe("#phoneNumber") {
                it("generates the correct text") {
                    let phone = phoneNumber.phoneNumber()
                    expect(phone).to(match("^\\d{3}-\\d{3}-\\d{4}$"))
                }
            }

            describe("#cellPhone") {
                it("generates the correct text") {
                    let phone = phoneNumber.cellPhone()
                    expect(phone).to(match("^\\(\\d{3}\\) \\d{3}-\\d{4}$"))
                }
            }
        }
    }
}
