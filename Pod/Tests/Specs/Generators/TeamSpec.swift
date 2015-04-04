import Quick
import Nimble

class TeamSpec: QuickSpec
{
    override func spec()
    {
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
        }
    }
}
