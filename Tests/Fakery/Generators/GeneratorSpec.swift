import Quick
import Nimble
@testable import Fakery

final class GeneratorSpec: QuickSpec {
  override func spec() {
    describe("Generator") {
      var generator: Faker.Generator!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        generator = Faker.Generator(parser: parser)
      }

      it("has parser") {
        expect(generator.parser).notTo(beNil())
      }

      describe("filling") {
        describe("#numerify") {
          it("replaces # with random numbers") {
            let numerified = generator.numerify("12####")
            expect(Int(numerified)).notTo(beNil())
            expect(numerified.contains("#")).to(beFalse())
            expect(numerified).to(match("^12\\d{4}$"))
          }
        }

        describe("#letterify") {
          it("replaces ? with random letters") {
            let letterified = generator.letterify("This is awes?me")
            expect(letterified.contains("?")).to(beFalse())
            expect(letterified).to(match("^This is awes[A-Za-z]me$"))
          }
        }

        describe("#bothify") {
          it("replaces # with random numbers and ? with random letters") {
            let bothified = generator.bothify("#th of ?pril")
            expect(bothified.contains("#")).to(beFalse())
            expect(bothified.contains("?")).to(beFalse())
            expect(bothified).to(match("^\\dth of [A-Za-z]pril$"))
          }
        }

        describe("#alphaNumerify") {
          it("removes special characters") {
            let latin = generator.alphaNumerify("Øghdasæå!y_=a")
            expect(latin).to(equal("ghdasy_a"))
          }
        }

        describe("#randomWordsFromKey") {
          it("generates random words") {
            let phrase = generator.randomWordsFromKey("company.buzzwords")
            expect(phrase).to(equal("Universal 24 hour software"))
          }
        }
      }
    }
  }
}
