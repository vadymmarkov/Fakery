import Foundation

public class Provider {

  var translations: [String: NSData] = [:]

  public func dataForLocale(locale: String) -> NSData? {
    var translation: NSData?

    if let translationData = translations[locale] {
      translation = translationData
    } else {
      let bundle = NSBundle(forClass: Provider.self)
      var path = bundle.pathForResource(locale, ofType: Config.pathExtension, inDirectory: Config.dirPath)

      if let resourcePath = NSBundle(forClass: Provider.self).resourcePath {
        let bundlePath = resourcePath + "/Faker.bundle"

        if let bundle = NSBundle(path: bundlePath) {
          path = bundle.pathForResource(locale, ofType: Config.pathExtension)
        }
      }


      if let path = path,
        fileURL: NSURL = NSURL(fileURLWithPath: path),
        data = NSData(contentsOfURL: fileURL){
          translation = data
          translations[locale] = data
      }
    }

    return translation
  }
}
