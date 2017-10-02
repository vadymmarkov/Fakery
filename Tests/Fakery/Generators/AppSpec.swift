import Quick
import Nimble
@testable import Fakery

final class AppSpec: QuickSpec {
  override func spec() {
    describe("App") {
      var app: App!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        app = App(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = app.name()
          expect(name).to(equal("Namfix"))
        }
      }

      describe("#version") {
        it("returns the correct text") {
          let version = app.version()
          expect(version).to(match("^0.\\d.\\d$"))
        }
      }

      describe("#author") {
        it("returns the correct text") {
          let author = app.author()
          expect(author).to(equal("Mr. Vadym Markov"))
        }
      }
    }
  }
}
