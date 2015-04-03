import Quick
import Nimble

class GeneratorSpec: QuickSpec
{
    override func spec()
    {
        describe("Generator") {
            describe("filling") {
                describe("#numerify") {
                    it("replaces # with random numbers") {
                        let numerified = Generator.numerify("12####")
                        expect(numerified.toInt()).notTo(beNil())
                        expect(find(numerified, "#")).to(beNil())
                        expect(numerified).to(match("^12\\d{4}$"))
                    }
                }

                describe("letterify") {
                    it("replaces ? with random letters") {
                        let letterified = Generator.letterify("This is awes?me")
                        expect(find(letterified, "?")).to(beNil())
                        expect(letterified).to(match("^This is awes[A-Za-z]me$"))
                    }
                }

                describe("bothify") {
                    it("replaces # with random numbers and ? with random letters") {
                        let bothified = Generator.bothify("#th of ?pril")
                        expect(find(bothified, "#")).to(beNil())
                        expect(find(bothified, "?")).to(beNil())
                        expect(bothified).to(match("^\\dth of [A-Za-z]pril$"))
                    }
                }
            }
        }
    }
}
