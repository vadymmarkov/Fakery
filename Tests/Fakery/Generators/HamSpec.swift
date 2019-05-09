import Quick
import Nimble
@testable import Fakery

final class HamSpec: QuickSpec {
  override func spec() {
    describe("Ham") {
      var ham: Ham!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        ham = Ham(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = ham.name()
          expect(name).to(equal("Smithfield Ham"))
        }
      }
    }
  }
}
