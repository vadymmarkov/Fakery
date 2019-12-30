import Foundation

extension Faker {
  public final class Date: Generator {
    public func backward(days: Int) -> Foundation.Date {
      return todayAddingDays(-days)
    }

    public func forward(_ days: Int) -> Foundation.Date {
      return todayAddingDays(days)
    }

    public func between(_ from: Foundation.Date, _ to: Foundation.Date) -> Foundation.Date {
      let fromInSeconds = from.timeIntervalSince1970
      let toInSeconds = to.timeIntervalSince1970
      let targetInSeconds = Number().randomDouble(min: fromInSeconds, max: toInSeconds)
      return Foundation.Date(timeIntervalSince1970: targetInSeconds)
    }

    public func birthday(_ minAge: Int, _ maxAge: Int) -> Foundation.Date {
      let olderAgeBirthDate = todayAddingYears(-maxAge)
      let earlierAgeBirthDate = todayAddingYears(-minAge)
      return between(earlierAgeBirthDate, olderAgeBirthDate)
    }

    private func todayAddingDays(_ days: Int) -> Foundation.Date {
      var dateComponents = DateComponents()
      dateComponents.day = days
      return todayAdding(dateComponents)
    }

    private func todayAddingYears(_ years: Int) -> Foundation.Date {
      var dateComponents = DateComponents()
      dateComponents.year = years
      return todayAdding(dateComponents)
    }

    private func todayAdding(_ dateComponents: DateComponents) -> Foundation.Date {
      let calendar = Calendar.current

      let todayDate = Foundation.Date()
      return calendar.date(byAdding: dateComponents, to: todayDate)!
    }
  }
}
