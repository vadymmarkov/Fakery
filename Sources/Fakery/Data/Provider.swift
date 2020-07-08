import Foundation

public final class Provider {
  var translations: [String: Data] = [:]

  // MARK: - Locale data

  public func dataForLocale(_ locale: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
      if
        let fileURL = Bundle.module.resourceURL?.appendingPathComponent(Config.localesDirectory)
            .appendingPathComponent(locale)
            .appendingPathExtension(Config.pathExtension)
      {
        if let data = try? Data(contentsOf: fileURL) {
          translation = data
          translations[locale] = data
        }
      }
    }

    return translation
  }
}
