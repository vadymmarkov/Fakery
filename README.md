# Faker

[![CI Status](http://img.shields.io/travis/markvaldy/Faker.svg?style=flat)](https://travis-ci.org/markvaldy/Faker)
[![Version](https://img.shields.io/cocoapods/v/Faker.svg?style=flat)](http://cocoadocs.org/docsets/Faker)
[![License](https://img.shields.io/cocoapods/l/Faker.svg?style=flat)](http://cocoadocs.org/docsets/Faker)
[![Platform](https://img.shields.io/cocoapods/p/Faker.svg?style=flat)](http://cocoadocs.org/docsets/Faker)

=====
This library is a port of Ruby's [Faker](https://github.com/stympy/faker) library that generates fake data.

It's useful in all the cases when you need to use some dummy data for testing, population of database during development, etc. pretty realistic. Are you still bothered with meaningless randomly character strings? Just relax and leave this job to Faker.

## Usage

```swift

let faker = Faker(locale: "nb-NO")

let firstName = faker.name.firstName()  //=> "Vadym"
let lastName = faker.name.lastName()    //=> "Markov"
let city = faker.address.city()         //=> "Oslo"
let email = faker.internet.email()      //=> "impressionwave@gmail.com"
```

## Installation

**Faker** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Faker'
```

## Author

Vadym Markov, impressionwave@gmail.com

## License

**Faker** is available under the MIT license. See the LICENSE file for more info.
