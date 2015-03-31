import Foundation
import SwiftyJSON


public class Generator
{
    public var locale: String {
        didSet {
            if locale != oldValue {
                data = [] // load data
            }
        }
    }

    var data: JSON = []
    var dataProvider: DataProvider

    public class var sharedInstance: Generator
    {
        struct Static {
            static let instance: Generator = Generator()
        }
        return Static.instance
    }

    public init()
    {
        locale = Config.defaultLocale
        dataProvider = DataProvider()
    }

    private func loadData()
    {
        if let localeData = dataProvider.dataForLocale(locale) {
            data = JSON(data: localeData, options: NSJSONReadingOptions.AllowFragments, error: nil)
        } else {
            fatalError("JSON file for '\(locale)' locale was not found.")
        }
    }
}
