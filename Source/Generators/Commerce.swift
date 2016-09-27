import Foundation

open class Commerce: Generator {

  open func color() -> String {
    return generate("commerce.color")
  }

  open func department(maximum: Int = 3, fixedAmount: Bool = false) -> String {
    let amount = fixedAmount ? maximum : 1 + Int(arc4random_uniform(UInt32(maximum)))

    let fetchedCategories = categories(amount)
    let count = fetchedCategories.count

    var department = ""

    if count > 1 {
      department = mergeCategories(fetchedCategories)
    } else if count == 1 {
      department = fetchedCategories[0]
    }

    return department
  }

  open func productName() -> String {
    return generate("commerce.product_name.adjective") + " "
      + generate("commerce.product_name.material") + " "
      + generate("commerce.product_name.product")
  }

  open func price() -> Double {
    let arc4randoMax:Double = 0x100000000
    return floor(Double((Double(arc4random()) / arc4randoMax) * 100.0) * 100) / 100.0
  }

  // MARK: - Helpers

  func categories(_ amount: Int) -> [String] {
    var categories: [String] = []

    while categories.count < amount {
      let category = generate("commerce.department")

      if !categories.contains(category) {
        categories.append(category)
      }
    }

    return categories
  }

  func mergeCategories(_ categories: [String]) -> String {
    let separator = generate("separator")
    let commaSeparated = categories[0..<categories.count - 1].joined(separator: ", ")

    return commaSeparated + separator + categories.last!
  }
}
