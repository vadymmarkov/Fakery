import SwiftyJSON

public class Parser
{
    public var locale: String {
        didSet {
            if locale != oldValue {
                loadData()
            }
        }
    }

    var data: JSON = []
    var provider: Provider

    public init(locale: String = Config.defaultLocale)
    {
        self.provider = Provider()
        self.locale = locale
        loadData()
    }

    // MARK: - Parsing

    public func parseKey(key: String) -> String
    {
        var parsed: String = ""

        var parts = split(key) {$0 == "."}
        if parts.count > 0 {
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
        if let localeData = provider.dataForLocale(locale) {
            data = JSON(data: localeData, options: NSJSONReadingOptions.AllowFragments, error: nil)
        } else if locale != Config.defaultLocale {
            locale = Config.defaultLocale
        } else {
            fatalError("JSON file for '\(locale)' locale was not found.")
        }
    }
}
