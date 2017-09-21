import Quick
import Nimble
@testable import Fakery

final class CommerceSpec: QuickSpec {
  override func spec() {
    describe("Commerce") {
      var commerce: Commerce!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        commerce = Commerce(parser: parser)
      }

      describe("#color") {
        it("generates the correct text") {
          let color = commerce.color()
          expect(color).to(equal("black"))
        }
      }

      describe("#department") {
        it("generates the correct text") {
          let department = commerce.department(maximum: 3, fixedAmount: true)
          expect(department.range(of: "Music")).notTo(beNil())
          expect(department.range(of: "Video")).notTo(beNil())
          expect(department.range(of: "Development")).notTo(beNil())
          expect(department.range(of: "&")).notTo(beNil())
          expect(department).to(match("^[A-Za-z]+, [A-Za-z]+ & [A-Za-z]+$"))
        }
      }

      describe("#productName") {
        it("generates the correct text") {
          let productName = commerce.productName()
          expect(productName).to(equal("Awesome Wooden Hat"))
        }
      }

      describe("#price") {
        it("generates the correct number") {
          let price = commerce.price()
          expect(price > 0.0).to(beTrue())
          expect(price <= 100.0).to(beTrue())
        }
      }

      describe("#categories") {
        it("returns the correct amount of categories") {
          let categories = commerce.categories(3)
          expect(categories.count == 3).to(beTrue())
        }

        it("returns the array of unique categories") {
          let categories = commerce.categories(3)
          var checked: [String] = []
          for category in categories {
            if checked.contains(category) { break }
            checked.append(category)
          }

          expect(checked.count).to(equal(categories.count))
        }
      }

      describe("#merge:categories") {
        it("returns the correct text") {
          let text = commerce.merge(categories: ["One", "Two", "Three", "Four"])
          expect(text).to(equal("One, Two, Three & Four"))
        }
      }
    }
  }
}
