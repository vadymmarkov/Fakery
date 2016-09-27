import Foundation

open class Address: Generator {

  open func city() -> String {
    return generate("address.city")
  }

  open func streetName() -> String {
    return generate("address.street_name")
  }

  open func secondaryAddress() -> String {
    return numerify(generate("address.secondary_address"))
  }

  open func streetAddress(includeSecondary: Bool = false) -> String {
    var streetAddress = numerify(generate("address.street_address"))

    if includeSecondary {
      streetAddress += " " + secondaryAddress()
    }

    return streetAddress
  }

  open func buildingNumber() -> String {
    return bothify(generate("address.building_number"))
  }

  open func postcode(stateAbbreviation: String = "") -> String {
    if stateAbbreviation.isEmpty {
      return bothify(generate("address.postcode"))
    }
    
    return bothify(generate("address.postcode_by_state.\(stateAbbreviation)"))
  }

  open func timeZone() -> String {
    return generate("address.time_zone")
  }

  open func streetSuffix() -> String {
    return generate("address.street_suffix")
  }

  open func citySuffix() -> String {
    return generate("address.city_suffix")
  }

  open func cityPrefix() -> String {
    return generate("address.city_prefix")
  }

  open func stateAbbreviation() -> String {
    return generate("address.state_abbr")
  }

  open func state() -> String {
    return generate("address.state")
  }

  open func county() -> String {
    return generate("address.county")
  }

  open func country() -> String {
    return generate("address.country")
  }

  open func countryCode() -> String {
    return generate("address.country_code")
  }

  open func latitude() -> Double {
    return drand48() * 180.0 - 90.0
  }

  open func longitude() -> Double {
    return drand48() * 360.0 - 180.0
  }
}
