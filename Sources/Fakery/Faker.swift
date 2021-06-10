public final class Faker {
  public var locale: String {
    didSet {
      if locale != oldValue {
        parser.locale = locale
      }
    }
  }

  public let address: Address
  public let app: App
  public let zelda: Zelda
  public let business: Business
  public let cat: Cat
  public let company: Company
  public let commerce: Commerce
  public let gender: Gender
  public let internet: Internet
  public let lorem: Lorem
  public let name: Name
  public let phoneNumber: PhoneNumber
  public let team: Team
  public let number: Number
  public let bank: Bank
  public let date: Date
  public let hobbit: Hobbit
  public let car: Car
  public let programmingLanguage: ProgrammingLanguage
  public let vehicle: Vehicle
  public let ham: Ham
  public let house: House

  let parser: Parser

  // MARK: - Initialization

  public convenience init(locale: String = Config.defaultLocale) {
    self.init(locale: locale, randomNumberGenerator: Config.randomNumberGenerator)
  }
    
  public init<T: RandomNumberGenerator>(
    locale: String = Config.defaultLocale,
    randomNumberGenerator: T
  ) {
    self.locale = locale
    let typeErasedRandomNumberGenerator = AnyRandomNumberGenerator(randomNumberGenerator)
    parser = Parser(locale: self.locale, randomNumberGenerator: typeErasedRandomNumberGenerator)
    address = Address(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    app = App(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    zelda = Zelda(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    business = Business(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    cat = Cat(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    company = Company(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    commerce = Commerce(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    gender = Gender(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    internet = Internet(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    lorem = Lorem(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    name = Name(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    phoneNumber = PhoneNumber(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    team = Team(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    number = Number(randomNumberGenerator: typeErasedRandomNumberGenerator)
    bank = Bank(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    date = Date(randomNumberGenerator: typeErasedRandomNumberGenerator)
    hobbit = Hobbit(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    car = Car(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    programmingLanguage = ProgrammingLanguage(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    vehicle = Vehicle(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    ham = Ham(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
    house = House(parser: parser, randomNumberGenerator: typeErasedRandomNumberGenerator)
  }
}
