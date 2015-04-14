import Foundation

public class Business: Generator {

  public func creditCardNumber() -> String {
    return generate("business.credit_card_numbers")
  }

  public func creditCardType() -> String {
    return generate("business.credit_card_types")
  }

  public func creditCardExpiryDate() -> NSDate? {
    let dateString = generate("business.credit_card_expiry_dates")
    return dateFormatter.dateFromString(dateString)
  }
}
