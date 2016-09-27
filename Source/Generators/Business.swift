import Foundation

open class Business: Generator {

  open func creditCardNumber() -> String {
    return generate("business.credit_card_numbers")
  }

  open func creditCardType() -> String {
    return generate("business.credit_card_types")
  }

  open func creditCardExpiryDate() -> Date? {
    let dateString = generate("business.credit_card_expiry_dates")
    return dateFormatter.date(from: dateString)
  }
}
