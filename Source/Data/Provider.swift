import Foundation

public class Provider {

    var translations: [String: NSData] = [:]

    public func dataForLocale(locale: String) -> NSData? {
        var translation: NSData?

        if let translationData = translations[locale] {
            translation = translationData
        } else {
            let bundle = NSBundle(forClass: Provider.self)
            if let path = bundle.pathForResource(locale, ofType: Config.pathExtension, inDirectory: Config.dirPath) {
                if let fileURL: NSURL = NSURL(fileURLWithPath: path) {
                    if let data = NSData(contentsOfURL: fileURL) {
                        translation = data
                        translations[locale] = data
                    }
                }
            }
        }

        return translation
    }
}
