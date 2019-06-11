extension Faker {
  public final class PhoneNumber: Generator {
    public func phoneNumber() -> String {
      return numerify(generate("phone_number.formats"))
    }

    public func cellPhone() -> String {
      return numerify(generate("cell_phone.formats"))
    }

    // US only
    public func areaCode() -> String {
      return generate("phone_number.area_code")
    }

    // US only
    public func exchangeCode() -> String {
      return generate("phone_number.exchange_code")
    }

    // US only
    public func subscriberNumber() -> String {
      return numerify("####")
    }

    public func numberExtension(_ length: Int) -> String {
      var template = ""

      for _ in 1...length {
        template += "#"
      }

      return numerify(template)
    }
  }
}
