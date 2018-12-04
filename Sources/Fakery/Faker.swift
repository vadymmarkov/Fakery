import Foundation

@objc public final class Faker: NSObject {
  public var locale: String {
    didSet {
      if locale != oldValue {
        parser.locale = locale
      }
    }
  }

  @objc public let address: Address
  @objc public let app: App
  @objc public let business: Business
  @objc public let company: Company
  @objc public let commerce: Commerce
  @objc public let internet: Internet
  @objc public let lorem: Lorem
  @objc public let name: Name
  @objc public let phoneNumber: PhoneNumber
  @objc public let team: Team
  @objc public let number: FakerNumber
  @objc public let bank: Bank
  @objc public let date: FakerDate

  let parser: Parser

  // MARK: - Initialization

  @objc public init(locale: String = Config.defaultLocale) {
    self.locale = locale
    parser = Parser(locale: self.locale)
    address = Address(parser: parser)
    app = App(parser: parser)
    business = Business(parser: parser)
    company = Company(parser: parser)
    commerce = Commerce(parser: parser)
    internet = Internet(parser: parser)
    lorem = Lorem(parser: parser)
    name = Name(parser: parser)
    phoneNumber = PhoneNumber(parser: parser)
    team = Team(parser: parser)
    number = FakerNumber()
    bank = Bank(parser: parser)
    date = FakerDate()
  }
}
