import Foundation

@objc public final class PhoneNumber: Generator {
  @objc public func phoneNumber() -> String {
    return numerify(generate("phone_number.formats"))
  }

  @objc public func cellPhone() -> String {
    return numerify(generate("cell_phone.formats"))
  }

  // US only
  @objc public func areaCode() -> String {
    return generate("phone_number.area_code")
  }

  // US only
  @objc public func exchangeCode() -> String {
    return generate("phone_number.exchange_code")
  }

  // US only
  @objc public func subscriberNumber() -> String {
    return numerify("####")
  }

  @objc public func numberExtension(_ length: Int) -> String {
    var template = ""

    for _ in 1...length {
      template += "#"
    }

    return numerify(template)
  }
}
