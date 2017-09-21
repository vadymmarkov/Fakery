import Quick
import Nimble
@testable import Fakery

final class TeamSpec: QuickSpec {
  override func spec() {
    describe("Team") {
      var team: Team!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        team = Team(parser: parser)
      }

      describe("#name") {
        it("returns the correct text") {
          let name = team.name()
          expect(name).to(equal("California owls"))
        }
      }

      describe("#creature") {
        it("returns the correct text") {
          let creature = team.creature()
          expect(creature).to(equal("owls"))
        }
      }

      describe("#state") {
        it("returns the correct text") {
          let state = team.state()
          expect(state).to(equal("California"))
        }
      }
    }
  }
}
