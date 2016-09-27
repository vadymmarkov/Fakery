open class PhoneNumber: Generator {

  open func phoneNumber() -> String {
    return numerify(generate("phone_number.formats"))
  }

  open func cellPhone() -> String {
    return numerify(generate("cell_phone.formats"))
  }

  // US only
  open func areaCode() -> String {
    return generate("phone_number.area_code")
  }

  // US only
  open func exchangeCode() -> String {
    return generate("phone_number.exchange_code")
  }

  // US only
  open func subscriberNumber() -> String {
    return numerify("####")
  }

  open func numberExtension(_ length: Int) -> String {
    var template = ""

    for _ in 1...length {
      template += "#"
    }

    return numerify(template)
  }
}
