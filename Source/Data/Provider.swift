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
                             inDirectory: Config.dirPath)

      if path == nil {
        path = bundle.path(forResource: locale,
                           ofType: Config.pathExtension,
                           inDirectory: Config.dirFrameworkPath)
      }

      if let resourcePath = Bundle(for: Provider.self).resourcePath {
        let bundlePath = resourcePath + "/Faker.bundle"

        if let bundle = Bundle(path: bundlePath) {
          path = bundle.path(forResource: locale, ofType: Config.pathExtension)
        }
      }

      if let path = path {
        let fileURL = URL(fileURLWithPath: path)

        if let data = try? Data(contentsOf: fileURL) {
          translation = data
          translations[locale] = data
        }
      }
    }

    return translation
  }
}
