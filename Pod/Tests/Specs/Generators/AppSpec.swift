import Quick
import Nimble

class AppSpec: QuickSpec
{
    override func spec()
    {
        describe("App") {
            var app: App!

            beforeEach {
                let parser = Parser(locale: "en-TEST")
                app = App(parser: parser)
            }

            describe(".name") {
                it("returns the correct text") {
                    let name = app.name()
                    expect(name).to(equal("Namfix"))
                }
            }
        }
    }
}
