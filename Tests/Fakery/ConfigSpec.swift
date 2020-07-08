import Quick
import Nimble
@testable import Fakery

final class ConfigSpec: QuickSpec {
  override func spec() {
    describe("Config") {
      it("has default values") {
        expect(Config.defaultLocale).to(equal("en"))
        expect(Config.pathExtension).to(equal("json"))
        expect(Config.localesDirectory).to(equal("Locales"))
      }
    }
  }
}
