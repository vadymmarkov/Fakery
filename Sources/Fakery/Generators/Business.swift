import Foundation

@objc public final class Business: Generator {
  @objc public func creditCardNumber() -> String {
    return generate("business.credit_card_numbers")
  }

  @objc public func creditCardType() -> String {
    return generate("business.credit_card_types")
  }

  @objc public func creditCardExpiryDate() -> Foundation.Date? {
    let dateString = generate("business.credit_card_expiry_dates")
    return dateFormatter.date(from: dateString)
  }
}
