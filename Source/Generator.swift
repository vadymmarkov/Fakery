import SwiftyJSON

public class Generator
{
    let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let numbers = Array(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

    public var locale: String {
        didSet {
            if locale != oldValue {
                loadData()
            }
        }
    }

    var data: JSON = []
    var dataProvider: DataProvider

    public class var sharedInstance: Generator
    {
        struct Static {
            static let instance: Generator = Generator()
        }
        return Static.instance
    }

    public init()
    {
        locale = Config.defaultLocale
        dataProvider = DataProvider()
    }

    // MARK: - Filling

    public func numerify(string: String) -> String
    {
        var replaced = String(map(string.generate()) {
            $0 == "#" ? string["\(arc4random_uniform(10))".startIndex] : $0
        })
        return "\(arc4random_uniform(9) + 1)\(dropFirst(replaced))"
    }

    public func letterify(string: String) -> String
    {
        return String(map(string.generate()) {
            let count = UInt32(self.uppercaseLetters.count)
            let char = self.uppercaseLetters[Int(arc4random_uniform(count))]
            return $0 == "?" ? char : $0
        })
    }

    public func bothify(string: String) -> String
    {
        return letterify(numerify(string))
    }

    // MARK: - Parsing

    public func parseKey(key: String) -> String
    {
        var parsed: String = ""

        var parts = split(key) {$0 == "."}
        if parts.count > 1 {
            var keyData = data[locale]["faker"]
            let subject = parts[0]

            for part in parts {
                keyData = keyData[part]
            }

            if let value = keyData.string {
                parsed = value
            } else if let array = keyData.arrayObject {
                let count = UInt32(array.count)
                if let item = array[Int(arc4random_uniform(count))] as? String {
                    parsed = item
                }
            }

            if find(parsed, "#") != nil {
                parsed = parseTemplate(parsed, withCurrentSubject: subject)
            }
        }

        return parsed
    }

    func parseTemplate(template: String, withCurrentSubject currentSubject: String) -> String
    {
        var text = ""
        let string = template as NSString
        let regex = NSRegularExpression(pattern: "(\\(?)#\\{([A-Za-z]+\\.)?([^\\}]+)\\}([^#]+)?",
            options: nil, error: nil)!

        let matches = regex.matchesInString(string as String, options: nil,
            range: NSMakeRange(0, string.length)) as [NSTextCheckingResult]

        if matches.count > 0 {
            for match in matches {
                if match.numberOfRanges < 4 {
                    continue
                }

                let prefixRange = match.rangeAtIndex(1)
                let subjectRange = match.rangeAtIndex(2)
                let methodRange = match.rangeAtIndex(3)
                let otherRange = match.rangeAtIndex(4)

                if prefixRange.length > 0 {
                    text += string.substringWithRange(prefixRange)
                }

                var subject = currentSubject + "."
                if subjectRange.length > 0 {
                    subject = string.substringWithRange(subjectRange)
                }

                if methodRange.length > 0 {
                    let key = subject.lowercaseString + string.substringWithRange(methodRange)
                    text += parseKey(key)
                }

                if otherRange.length > 0 {
                    text += string.substringWithRange(otherRange)
                }
            }
        } else {
            text = template
        }

        return text
    }

    // MARK: - Data loading

    func loadData()
    {
        if let localeData = dataProvider.dataForLocale(locale) {
            data = JSON(data: localeData, options: NSJSONReadingOptions.AllowFragments, error: nil)
        } else if locale != Config.defaultLocale {
            locale = Config.defaultLocale
        } else {
            fatalError("JSON file for '\(locale)' locale was not found.")
        }
    }
}
