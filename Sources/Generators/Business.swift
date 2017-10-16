import Foundation

public final class Business: Generator {
  public func creditCardNumber() -> String {
    return generate("business.credit_card_numbers")
  }

  public func creditCardType() -> String {
    return generate("business.credit_card_types")
  }

  public func creditCardExpiryDate() -> Date? {
    let dateString = generate("business.credit_card_expiry_dates")
    return dateFormatter.date(from: dateString)
  }
}
