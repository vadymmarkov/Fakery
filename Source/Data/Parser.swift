import Foundation

public final class Parser {

  public var locale: String {
    didSet {
      if locale != oldValue {
        loadData()
      }
    }
  }

  var data = [String: Any]()
  var provider: Provider

  // MARK: - Initialization

  public init(locale: String = Config.defaultLocale) {
    self.locale = locale
    provider = Provider()
    loadData()
  }

  // MARK: - Parsing

  public func fetch(_ key: String) -> String {
    var parsed = ""

    guard let keyData = fetchRaw(key) else {
      return parsed
    }

    let subject = getSubject(key)

    if let value = keyData as? String {
      parsed = value
    } else if let array = keyData as? [String], let item = array.random() {
      parsed = item
    }

    if parsed.range(of: "#{") != nil {
      parsed = parse(parsed, forSubject: subject)
    }

    return parsed
  }

  public func fetchRaw(_ key: String) -> Any? {
    let parts = key.components(separatedBy: ".")

    guard let localeData = data[locale] as? [String: Any],
      var parsed = localeData["faker"] as? [String: Any],
      !parts.isEmpty else { return nil }

    var result: Any?

    for part in parts {
      guard let parsedPart = parsed[part] as? [String: Any] else {
        result = parsed[part]
        continue
      }

      parsed = parsedPart
      result = parsedPart
    }

    return result
  }

  func parse(_ template: String, forSubject subject: String) -> String {
    var text = ""
    let string = template as NSString
    var regex: NSRegularExpression

    do {
      try regex = NSRegularExpression(pattern: "(\\(?)#\\{([A-Za-z]+\\.)?([^\\}]+)\\}([^#]+)?",
                                      options: .caseInsensitive)
      let matches = regex.matches(in: string as String,
        options: .reportCompletion,
        range: NSMakeRange(0, string.length))

      guard !matches.isEmpty else {
        return template
      }

      for match in matches {
        if match.numberOfRanges < 4 {
          continue
        }

        let prefixRange = match.rangeAt(1)
        let subjectRange = match.rangeAt(2)
        let methodRange = match.rangeAt(3)
        let otherRange = match.rangeAt(4)

        if prefixRange.length > 0 {
          text += string.substring(with: prefixRange)
        }

        var subjectWithDot = subject + "."

        if subjectRange.length > 0 {
          subjectWithDot = string.substring(with: subjectRange)
        }

        if methodRange.length > 0 {
          let key = subjectWithDot.lowercased() + string.substring(with: methodRange)
          text += fetch(key)
        }

        if otherRange.length > 0 {
          text += string.substring(with: otherRange)
        }
      }
    } catch {}

    return text
  }

  func getSubject(_ key: String) -> String {
    var subject: String = ""
    var parts = key.components(separatedBy: ".")

    if parts.count > 0 {
      subject = parts[0]
    }

    return subject
  }

  // MARK: - Data loading

  func loadData() {
    guard let localeData = provider.dataForLocale(locale),
      let parsedData = try? JSONSerialization.jsonObject(with: localeData, options: .allowFragments),
      let json = parsedData as? [String: Any] else {
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
