import Quick
import Nimble

class LoremSpec: QuickSpec {

    override func spec() {
        describe("Lorem") {
            var lorem: Lorem!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                lorem = Lorem(parser: parser)
            }

            describe("#word") {
                it("returns the correct text") {
                    let word = lorem.word()
                    expect(word).to(match("^[A-Za-z]+$"))
                }
            }

            describe("#words") {
                context("without the amount - 3 words by default") {
                    it("returns the expected amount of words") {
                        let word = lorem.words()
                        expect(word).to(match("^[A-Za-z]+ [A-Za-z]+ [A-Za-z]+$"))
                    }
                }

                context("with the amount of words") {
                    it("returns the expected amount of words") {
                        let word = lorem.words(amount: 2)
                        expect(word).to(match("^[A-Za-z]+ [A-Za-z]+$"))
                    }
                }
            }
        }
    }
}
