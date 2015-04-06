import Foundation

public class Commerce: Generator
{
    public func color() -> String
    {
        return generate("commerce.color")
    }

    public func department(maximum: Int = 3, fixedAmount: Bool = false) -> String
    {
        var amount = fixedAmount ? maximum : 1 + Int(arc4random_uniform(UInt32(maximum)))

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

    // MARK: - Private

    func categories(amount: Int) -> [String]
    {
        var categories: [String] = []
        while categories.count < amount {
            let category = generate("commerce.department")
            if !contains(categories, category) {
                categories.append(category)
            }
        }

        return categories
    }

    func mergeCategories(categories: [String]) -> String
    {
        let separator = generate("separator")


        let commaSeparated = ", ".join(categories[0..<categories.count - 1])
        return commaSeparated + separator + categories.last!
    }
}
