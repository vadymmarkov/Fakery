import Quick
import Nimble

class CommerceSpec: QuickSpec
{
    override func spec()
    {
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
                    var department = commerce.department(maximum: 3, fixedAmount: true)
                    expect(department.rangeOfString("Music")).notTo(beNil())
                    expect(department.rangeOfString("Video")).notTo(beNil())
                    expect(department.rangeOfString("Development")).notTo(beNil())
                    expect(department.rangeOfString("&")).notTo(beNil())
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
                    var categories = commerce.categories(3)
                    expect(categories.count == 3).to(beTrue())
                }

                it("returns the array of unique categories") {
                    var categories = commerce.categories(3)
                    var checked: [String] = []
                    for category in categories {
                        if contains(checked, category) {
                            break
                        }
                        checked.append(category)
                    }

                    expect(checked.count).to(equal(categories.count))
                }
            }

            describe("#mergeCategories") {
                it("returns the correct text") {
                    var text = commerce.mergeCategories(["One", "Two", "Three", "Four"])
                    expect(text).to(equal("One, Two, Three & Four"))
                }
            }
        }
    }
}
