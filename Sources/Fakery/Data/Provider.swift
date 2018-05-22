import Foundation

public final class Provider {
  var translations: [String: Data] = [:]

  // MARK: - Locale data

  public func dataForLocale(_ locale: String) -> Data? {
    var translation: Data?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
			if let data = Locale.en.data(using: .utf8){
				translation = data
				translations[locale] = data
			}
    }

    return translation
  }
}
