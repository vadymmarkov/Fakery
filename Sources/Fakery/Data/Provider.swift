import Foundation

public final class Provider {
  var translations: [String: Data] = [:]

  // MARK: - Locale data

  public func dataForLocale(_ locale: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
      let bundle = Bundle(for: Provider.self)

      var path = bundle.path(forResource: locale,
                             ofType: Config.pathExtension,
                             inDirectory: Config.dirPath) ??
                 bundle.path(forResource: locale,
                             ofType: Config.pathExtension,
                             inDirectory: Config.dirFrameworkPath)

      if !Config.dirResourcePath.isEmpty {
        path = "\(Config.dirResourcePath)/\(locale).\(Config.pathExtension)"
      }

      if let resourcePath = Bundle(for: Provider.self).resourcePath {
        let bundlePath = resourcePath + "/Faker.bundle"

        if let bundle = Bundle(path: bundlePath) {
          path = bundle.path(forResource: locale, ofType: Config.pathExtension)
        }
      }

      if let data = dataAtPath(path: path) {
        translation = data
        translations[locale] = data
      }
    }

    return translation
  }
  
  public func dataForLocale(_ locale: String, path: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    }
    else {
      if let data = dataAtPath(path: path) {
        translation = data
        translations[locale] = data
      }
    }
    return translation
  }
  
  private func dataAtPath(path: String?) -> Data? {
    if let path = path {
      let fileURL = URL(fileURLWithPath: path)
      return try? Data(contentsOf: fileURL)
    }
    return nil
  }
}
