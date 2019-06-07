import Quick
import Nimble
import Foundation
@testable import Fakery

final class DateSpec: QuickSpec {
  override func spec() {
    describe("Date") {
      var date: Faker.Date!

      beforeEach {
        date = Faker.Date()
      }

      describe("#between") {
        context("two dates") {
          let from = Date(timeIntervalSince1970: 0)
          let to = Date(timeIntervalSince1970: 60*60*24*365)
          it("returns always a date between those two dates") {
            for _ in 1...100 {
              let randomDate = date.between(from, to)
              expect(randomDate).to(beLessThan(to))
              expect(randomDate).to(beGreaterThan(from))
            }
          }
        }
      }

      describe("#backward") {
        context("called with 5 days") {
          it("returns a date between today and 5 days before today") {
            let daysBefore = 5
            let daysBeforeAsSeconds = -Double(daysBefore)*24*60*60
            let today = Foundation.Date()
            for _ in 1...100 {
              let randomDate = date.backward(days: daysBefore)
              expect(randomDate).to(beLessThan(today))
              expect(randomDate).to(beGreaterThan(today.addingTimeInterval(daysBeforeAsSeconds)))
            }
          }
        }
      }

      describe("#forward") {
        context("called with 5 days") {
          it("returns a date between today and 5 days after today") {
            let daysAfter = 5
            let daysAfterAsSeconds = -Double(daysAfter)*24*60*60
            let today = Foundation.Date()
            for _ in 1...100 {
              let randomDate = date.backward(days: daysAfter)
              expect(randomDate).to(beLessThan(today))
              expect(randomDate).to(beGreaterThan(today.addingTimeInterval(daysAfterAsSeconds)))
            }
          }
        }
      }

      describe("#birthday") {
        context("called with ages 30 and 50") {
          it("returns a date for a person whose age is between 30 and 50") {
            let minAge = 30
            let maxAge = 50

            let calendar = Calendar.current

            func yearsBeforeDate(_ years: Int, _ date: Foundation.Date) -> Foundation.Date {
              var dc = DateComponents()
              dc.year = -years

              let calendar = Calendar.current
              return calendar.date(byAdding: dc, to: date)!
            }

            let today = Foundation.Date()
            let minBirthdate = yearsBeforeDate(maxAge, today)
            let maxBirthdate = yearsBeforeDate(minAge, today)
            for _ in 1...1 {
              let randomDate = date.birthday(minAge, maxAge)
              expect(randomDate).to(beLessThan(maxBirthdate))
              expect(randomDate).to(beGreaterThan(minBirthdate))
            }
          }
        }
      }

    }
  }
}
