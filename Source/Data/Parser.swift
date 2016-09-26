import Foundation

public class Parser {

  public var locale: String {
    didSet {
      if locale != oldValue {
        loadData()
      }
    }
  }

  var data = [String: AnyObject]()
  var provider: Provider

  public init(locale: String = Config.defaultLocale) {
    self.provider = Provider()
    self.locale = locale
    loadData()
  }

  // MARK: - Parsing

  public func fetch(key: String) -> String {
    var parsed = ""

    if let keyData = fetchRaw(key) {
      let subject = getSubject(key)

      if let value = keyData as? String {
        parsed = value
      } else if let array = keyData as? [String] {
        if let item = array.random() {
          parsed = item
        }
      }

      if parsed.rangeOfString("#{") != nil {
        parsed = parse(parsed, forSubject: subject)
      }
    }

    return parsed
  }

  public func fetchRaw(key: String) -> AnyObject? {
    let parts = key.componentsSeparatedByString(".")

    guard let localeData = data[locale], var parsed = localeData["faker"] where !parts.isEmpty else {
      return nil
    }

    for part in parts {
      guard let parsedPart = parsed?[part] else { continue }
      parsed = parsedPart
    }

    return parsed
  }

  func parse(template: String, forSubject subject: String) -> String {
    var text = ""
    let string = template as NSString
    var regex: NSRegularExpression
    do {
      try regex = NSRegularExpression(pattern: "(\\(?)#\\{([A-Za-z]+\\.)?([^\\}]+)\\}([^#]+)?", options: .CaseInsensitive)
      let matches = regex.matchesInString(string as String,
        options: .ReportCompletion,
        range: NSMakeRange(0, string.length))

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

          var subjectWithDot = subject + "."
          if subjectRange.length > 0 {
            subjectWithDot = string.substringWithRange(subjectRange)
          }

          if methodRange.length > 0 {
            let key = subjectWithDot.lowercaseString + string.substringWithRange(methodRange)
            text += fetch(key)
          }

          if otherRange.length > 0 {
            text += string.substringWithRange(otherRange)
          }
        }
      } else {
        text = template
      }
    } catch {}


    return text
  }

  func getSubject(key: String) -> String {
    var subject: String = ""
    var parts = key.componentsSeparatedByString(".")

    if parts.count > 0 {
      subject = parts[0]
    }

    return subject
  }

  // MARK: - Data loading

  func loadData() {
    guard let localeData = provider.dataForLocale(locale),
      parsedData = try? NSJSONSerialization.JSONObjectWithData(localeData, options: .AllowFragments),
      json = parsedData as? [String: AnyObject] else {
        if locale != Config.defaultLocale {
          locale = Config.defaultLocale
        } else {
          fatalError("JSON file for '\(locale)' locale was not found.")
        }
        return
    }

    data = json
  }
}
