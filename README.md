![Fakery logo](https://raw.githubusercontent.com/vadymmarkov/Fakery/master/Images/logo.png)
[![CI Status](http://img.shields.io/travis/vadymmarkov/Fakery.svg?style=flat)](https://travis-ci.org/vadymmarkov/Fakery)
[![Version](https://img.shields.io/cocoapods/v/Fakery.svg?style=flat)](http://cocoadocs.org/docsets/Fakery)
[![License](https://img.shields.io/cocoapods/l/Fakery.svg?style=flat)](http://cocoadocs.org/docsets/Fakery)
[![Platform](https://img.shields.io/cocoapods/p/Fakery.svg?style=flat)](http://cocoadocs.org/docsets/Fakery)

This is a Swift port of Ruby's [Faker](https://github.com/stympy/faker) library that generates fake data.

Are you still bothered with meaningless randomly character strings? Just relax and leave this job to **Fakery**.
It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc.

**NOTE**: Generated data is pretty realistic, supports a range of locales, but returned values are not guaranteed to be unique.

## Table of Contents

* [Usage](#usage)
* [Localization](#localization)
* [Generators](#generators)
  * [Address](#address)
  * [App](#app)
  * [Business](#business)
  * [Commerce](#commerce)
  * [Company](#company)
  * [Internet](#internet)
  * [Lorem](#lorem)
  * [Name](#name)
  * [Phone number](#phone-number)
  * [Team](#team)
* [Installation](#installation)
* [Contributing](#contributing)
* [Author](#author)
* [License](#license)

## Usage

```swift

let faker = Faker(locale: "nb-NO")

let firstName = faker.name.firstName()  //=> "Emilie"
let lastName = faker.name.lastName()    //=> "Hansen"
let city = faker.address.city()         //=> "Oslo"
```

## Localization

**Fakery** is quite powerful when it comes to generation of locale-specific data.
In `Resources/Locales` you can find JSON files for more than 20 locales, and, of course, it's not a limit.
Feel free to contribute and add more!  

## Generators

### Address

```swift

faker.address.city() //=> "Oslo"
faker.address.streetName() //=> "North Avenue"
faker.address.secondaryAddress() //=> "Apt. 123"
faker.address.streetAddress(includeSecondary: Bool) //=> "12 North Avenue"
faker.address.buildingNumber() //=> "123"
faker.address.postcode(stateAbbreviation: String) //=> "0884"
faker.address.timeZone() //=> "America/Los_Angeles"
faker.address.streetSuffix() //=> "Avenue"
faker.address.citySuffix() //=> "town"
faker.address.cityPrefix() //=> "North"
faker.address.stateAbbreviation() //=> "CA"
faker.address.state() //=> "California"
faker.address.country() //=> "United States of America"
faker.address.countryCode() //=> "US"
faker.address.latitude() //=> -58.17256227443719
faker.address.longitude() //=> -156.65548382095133
```

### App

```swift

faker.app.name() //=> "Namfix"
faker.app.version() //=> "0.1.1"
faker.app.author() //=> "Ida Adams"
```

### Business

```swift

faker.business.creditCardNumber() //=> "1234-2121-1221-1211"
faker.business.creditCardType() //=> "visa"
faker.business.creditCardExpiryDate() //=> "2020-10-12"
```

### Commerce

```swift

faker.commerce.color() //=> "black"
faker.commerce.department(maximum: Int, fixedAmount: Bool) //=> "Music"
faker.commerce.productName() //=> "Awesome Wooden Hat"
faker.commerce.price() // 90.5
```

### Company

```swift

faker.company.name() //=> "Adams Inc"       
faker.company.suffix() //=> "Inc"
faker.company.catchPhrase() //=> "Universal software"        
faker.company.bs() //=> "implement innovative methodologies"
faker.company.logo() // "http://pigment.github.io/fake-logos/logos/medium/color/1.png"
```

### Internet

```swift

faker.internet.username(separator: String?) //=> "ida4"       
faker.internet.domainName(alphaNumericOnly: Bool) //=> "example.com"        
faker.internet.domainWord(alphaNumericOnly: Bool) //=> "domainword"        
faker.internet.domainSuffix() //=> "com"
faker.internet.email() // => "ida4@some.info"
faker.internet.freeEmail() //=> "gmail.com"
faker.internet.safeEmail() //=> "adams@example.org"
faker.internet.password(minimumLength: Int, maximumLength: Int) //=> "e2dddhwd1g5qhvhgfi"
faker.internet.ipV4Address() //=> "24.29.18.175"
faker.internet.ipV6Address() //=> "ac5f:d696:3807:1d72:2eb5:4e81:7d2b:e1df"
faker.internet.url() //=> "http://example.com/ida4"
```

### Lorem

```swift

faker.lorem.word() //=> "repellendus"         
faker.lorem.words(amount: Int) //=> ["dolores", "adipisci", "nesciunt"]      
faker.lorem.character() //=> "a"        
faker.lorem.characters(amount: Int) // Default = 255
faker.lorem.sentence(wordsAmount: Int) // Default = 4
faker.lorem.sentences(amount: Int) // Default = 3
faker.lorem.paragraph(sentencesAmount: Int) // Default = 3
faker.lorem.paragraphs(amount: Int) // Default = 3
```

### Name

```swift

faker.name.name() //=> "Ida Adams"        
faker.name.firstName() //=> "Ida"
faker.name.lastName() //=> "Adams"
faker.name.prefix() //=> "Mrs."
faker.name.suffix() //=> "PhD"
faker.name.title() //=> "Lead"
```

### Phone number

```swift

faker.phoneNumber.phoneNumber() //=> "1-333-333-3333"        
faker.phoneNumber.cellPhone() //=> "333-333-3333"
faker.phoneNumber.areaCode() //=> "201"
faker.phoneNumber.exchangeCode() //=> "201"
faker.phoneNumber.subscriberNumber() //=> "1234"
faker.phoneNumber.numberExtension(length: Int) // "123"
```

### Team

```swift

faker.team.name() //=> "bats"         
faker.team.creature() //=> "Alabama bats"
faker.team.state() // => "Alabama"
```

## Installation

**Fakery** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Fakery'
```

## Contributing

Please see our [playbook](https://github.com/hyperoslo/playbook/blob/master/GIT_AND_GITHUB.md) for guidelines on contributing.

## Author

Vadym Markov, markov.vadym@gmail.com

## License

**Fakery** is available under the MIT license. See the LICENSE file for more info.
