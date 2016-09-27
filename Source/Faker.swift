open class Faker {

  open var locale: String {
    didSet {
      if locale != oldValue {
        parser.locale = locale
      }
    }
  }

  open let address: Address
  open let app: App
  open let business: Business
  open let company: Company
  open let commerce: Commerce
  open let internet: Internet
  open let lorem: Lorem
  open let name: Name
  open let phoneNumber: PhoneNumber
  open let team: Team
  open let number: Number

  let parser: Parser

  public init(locale: String = Config.defaultLocale) {
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
    number = Number()
  }
}
