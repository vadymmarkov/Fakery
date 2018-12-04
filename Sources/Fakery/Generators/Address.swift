import Foundation
import CoreLocation

@objc public final class Address: Generator {
  @objc public func city() -> String {
    return generate("address.city")
  }

  @objc public func streetName() -> String {
    return generate("address.street_name")
  }

  @objc public func secondaryAddress() -> String {
    return numerify(generate("address.secondary_address"))
  }

  @objc public func streetAddress(includeSecondary: Bool = false) -> String {
    var streetAddress = numerify(generate("address.street_address"))

    if includeSecondary {
      streetAddress += " " + secondaryAddress()
    }

    return streetAddress
  }

  @objc public func buildingNumber() -> String {
    return bothify(generate("address.building_number"))
  }

  @objc public func postcode(stateAbbreviation: String = "") -> String {
    if stateAbbreviation.isEmpty {
      return bothify(generate("address.postcode"))
    }

    return bothify(generate("address.postcode_by_state.\(stateAbbreviation)"))
  }

  @objc public func timeZone() -> String {
    return generate("address.time_zone")
  }

  @objc public func streetSuffix() -> String {
    return generate("address.street_suffix")
  }

  @objc public func citySuffix() -> String {
    return generate("address.city_suffix")
  }

  @objc public func cityPrefix() -> String {
    return generate("address.city_prefix")
  }

  @objc public func stateAbbreviation() -> String {
    return generate("address.state_abbr")
  }

  @objc public func state() -> String {
    return generate("address.state")
  }

  @objc public func county() -> String {
    return generate("address.county")
  }

  @objc public func country() -> String {
    return generate("address.country")
  }

  @objc public func countryCode() -> String {
    return generate("address.country_code")
  }

  @objc public func latitude() -> Double {
    return drand48() * 180.0 - 90.0
  }

  @objc public func longitude() -> Double {
    return drand48() * 360.0 - 180.0
  }
  
  @objc public func coordinate(inRadius radius: Double, fromCenter center: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    let y0 = center.latitude
    let x0 = center.longitude
    
    // Convert meters to degrees for radius
    let radiusInDegrees = radius / 111300.0
    
    // Random point in circle
    let u = Double(arc4random()) / 0xFFFFFFFF
    let v = Double(arc4random()) / 0xFFFFFFFF
    let w = radiusInDegrees * sqrt(u)
    let t = 2 * .pi * v
    let x = w * cos(t)
    let y = w * sin(t)
    
    // Adjust longitude (x) to adjust for east-west shrinking in distance
    let latRadians = y0 * .pi / 180
    let newx = x / cos(latRadians)
    
    // Set found random point
    let foundLatitude = y + y0
    let foundLongitude = newx + x0
    
    return CLLocationCoordinate2D.init(latitude: foundLatitude, longitude: foundLongitude)
  }
}
