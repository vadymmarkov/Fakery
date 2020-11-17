import Foundation

public final class Provider {
  var translations: [String: Data] = [:]

  // MARK: - Locale data

  public func dataForLocale(_ locale: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
      #if SWIFT_PACKAGE
      let bundle = Bundle.module
      #else
      let bundle = Bundle(for: Provider.self)
      #endif

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
