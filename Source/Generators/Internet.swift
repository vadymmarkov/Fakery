import Foundation

public class Internet: Generator {

    public func username(separator: String? = nil) -> String {
        var components: [String] = [
            generate("name.first_name"),
            generate("name.last_name"),
            "\(arc4random_uniform(10000))"
        ]

        let randomCount = UInt32(components.count) - 1
        let count = Int(arc4random_uniform(randomCount) + randomCount)

        var gap = ""
        if let sep = separator {
            gap = sep
        }
        return gap.join(components[0..<count]).stringByReplacingOccurrencesOfString("'", withString: "").lowercaseString
    }

    public func domainName(alphaNumericOnly: Bool = true) -> String {
        return domainWord(alphaNumericOnly: alphaNumericOnly) + "." + domainSuffix()
    }

    public func domainWord(alphaNumericOnly: Bool = true) -> String {
        var nameParts = split(generate("company.name")) {$0 == " "}
        var name = ""
        if let first = nameParts.first {
            name = first
        } else {
            name = letterify("?????")
        }

        let result = alphaNumericOnly ? alphaNumerify(name) : name
        return result.lowercaseString
    }

    public func domainSuffix() -> String {
        return generate("internet.domain_suffix")
    }

    public func email() -> String {
        return "@".join([username(), domainName()])
    }

    public func freeEmail() -> String {
        return "@".join([username(), generate("internet.free_email")])
    }

    public func safeEmail() -> String {
        let topLevelDomains = ["org", "com", "net"]
        let count = UInt32(topLevelDomains.count)
        let topLevelDomain = topLevelDomains[Int(arc4random_uniform(count))]

        return "@".join([username(), "example." + topLevelDomain])
    }
}
