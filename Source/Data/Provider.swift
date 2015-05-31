import Foundation

public class Provider {

  var translations: [String: NSData] = [:]

  public func dataForLocale(locale: String) -> NSData? {
    var translation: NSData?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
      var bundle = NSBundle(forClass: Provider.self)
      if let bundlePath = NSBundle(forClass: Provider.self).resourcePath?.stringByAppendingPathComponent("Faker.bundle") {
        if let fakerBundle = NSBundle(path: bundlePath) {
          bundle = fakerBundle
        }
      }

      if let path = bundle.pathForResource(locale, ofType: Config.pathExtension, inDirectory: Config.dirPath),
        fileURL: NSURL = NSURL(fileURLWithPath: path),
        data = NSData(contentsOfURL: fileURL){
          translation = data
          translations[locale] = data
      }
    }

    return translation
  }
}
