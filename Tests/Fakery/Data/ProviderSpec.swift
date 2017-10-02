import Quick
import Nimble
@testable import Fakery

final class ProviderSpec: QuickSpec {
  override func spec() {
    describe("Provider") {
      var provider: Provider!

      beforeEach {
        provider = Provider()
      }

      describe("#init") {
        it ("is initialized") {
          expect(provider).notTo(beNil())
        }

        it ("has empty translations dictionary") {
          expect(provider.translations).notTo(beNil())
          expect(provider.translations.count).to(equal(0))
        }
      }

      describe("#dataForLocale") {
        it ("returns data if locale file exists") {
          expect(provider.dataForLocale("en")).notTo(beNil())
        }

        it ("returns nil if locale file doesn't exist") {
          expect(provider.dataForLocale("bla")).to(beNil())
        }
      }
    }
  }
}
