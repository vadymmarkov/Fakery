public class Faker
{
    public let address: Address

    private let locale: String
    private let parser: Parser

    public init(locale: String)
    {
        self.locale = locale
        parser = Parser(locale: self.locale)

        address = Address(parser: parser)
    }
}
