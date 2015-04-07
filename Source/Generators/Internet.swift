import Foundation

public class Internet: Generator {

    public func username(separator: String? = nil) -> String {
        var components: [String] = [
            generate("name.first_name"),
            generate("name.last_name"),
            "\(arc4random_uniform(10000))"
        ]

        let randomCount = UInt32(components.count) - 1
        let count = 3//Int(arc4random_uniform(randomCount) + randomCount)

        var gap = ""
        if let sep = separator {
            gap = sep
        }
        return gap.join(components[0..<count]).stringByReplacingOccurrencesOfString("'", withString: "").lowercaseString
    }
}
