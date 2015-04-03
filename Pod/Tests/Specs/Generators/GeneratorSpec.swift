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
                    }
                }

                describe("letterify") {
                    it("replaces ? with random letters") {
                        let letterified = Generator.letterify("This is awes?me")
                        expect(find(letterified, "?")).to(beNil())
                    }
                }

                describe("bothify") {
                    it("replaces # with random numbers and ? with random letters") {
                        let bothified = Generator.bothify("#th of ?pril")
                        expect(find(bothified, "#")).to(beNil())
                        expect(find(bothified, "?")).to(beNil())
                    }
                }
            }
        }
    }
}
