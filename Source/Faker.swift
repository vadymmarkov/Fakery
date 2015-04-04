public class Faker
{
    public var locale: String {
        didSet {
            if locale != oldValue {
                parser.locale = locale
            }
        }
    }

    public let address: Address

    let parser: Parser

    public init(locale: String = Config.defaultLocale)
    {
        self.locale = locale
        parser = Parser(locale: self.locale)

        address = Address(parser: parser)
    }
}
