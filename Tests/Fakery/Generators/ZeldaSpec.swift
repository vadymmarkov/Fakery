import Quick
import Nimble
@testable import Fakery

final class ZeldaSpec: QuickSpec {
  override func spec() {
    describe("Zelda") {
      var zelda: Zelda!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        zelda = Zelda(parser: parser)
      }

      describe("#game") {
        it("returns the correct text") {
          let game = zelda.game()
          expect(game).to(equal("Ocarina of Time"))
        }
      }
    }
  }
}
