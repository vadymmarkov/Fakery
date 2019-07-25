import Foundation
#if os(Linux)
public struct Location {
  let latitude: Double
  let longitude: Double
}
#else
import CoreLocation
public typealias Location = CLLocationCoordinate2D
#endif

extension Faker {
  public final class Address: Generator {
    public func city() -> String {
      return generate("address.city")
    }

    public func streetName() -> String {
      return generate("address.street_name")
    }

    public func secondaryAddress() -> String {
      return numerify(generate("address.secondary_address"))
    }

    public func streetAddress(includeSecondary: Bool = false) -> String {
      var streetAddress = numerify(generate("address.street_address"))

      if includeSecondary {
        streetAddress += " " + secondaryAddress()
      }

      return streetAddress
    }

    public func buildingNumber() -> String {
      return bothify(generate("address.building_number"))
    }

    public func postcode(stateAbbreviation: String = "") -> String {
      if stateAbbreviation.isEmpty {
        return bothify(generate("address.postcode"))
      }

      return bothify(generate("address.postcode_by_state.\(stateAbbreviation)"))
    }

    public func timeZone() -> String {
      return generate("address.time_zone")
    }

    public func streetSuffix() -> String {
      return generate("address.street_suffix")
    }

    public func citySuffix() -> String {
      return generate("address.city_suffix")
    }

    public func cityPrefix() -> String {
      return generate("address.city_prefix")
    }

    public func stateAbbreviation() -> String {
      return generate("address.state_abbr")
    }

    public func state() -> String {
      return generate("address.state")
    }

    public func county() -> String {
      return generate("address.county")
    }

    public func country() -> String {
      return generate("address.country")
    }

    public func countryCode() -> String {
      return generate("address.country_code")
    }

    public func latitude() -> Double {
      return drand48() * 180.0 - 90.0
    }

    public func longitude() -> Double {
      return drand48() * 360.0 - 180.0
    }

    public func coordinate(inRadius radius: Double, fromCenter center: Location) -> Location {
      let y0 = center.latitude
      let x0 = center.longitude

      // Convert meters to degrees for radius
      let radiusInDegrees = radius / 111300.0

      // Random point in circle
      #if swift(>=4.2)
      let rhoRandom = Double.random(in: 0..<Double.greatestFiniteMagnitude) / 0xFFFFFFFF
      let phiRandom = Double.random(in: 0..<Double.greatestFiniteMagnitude) / 0xFFFFFFFF
      #else
      let rhoRandom = Double(arc4random()) / 0xFFFFFFFF
      let phiRandom = Double(arc4random()) / 0xFFFFFFFF
      #endif
      let rho = radiusInDegrees * sqrt(rhoRandom)
      let phi = 2 * .pi * phiRandom
      let xPos = rho * cos(phi)
      let yPos = rho * sin(phi)

      // Adjust longitude (x) to adjust for east-west shrinking in distance
      let latRadians = y0 * .pi / 180
      let newx = xPos / cos(latRadians)

      // Set found random point
      let foundLatitude = yPos + y0
      let foundLongitude = newx + x0

      return Location(latitude: foundLatitude, longitude: foundLongitude)
    }
  }
}
