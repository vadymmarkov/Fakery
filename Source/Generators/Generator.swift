import Foundation

public class Generator {

  public struct Constants {
    public static let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
    public static let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".characters)
    public static let numbers = Array("0123456789".characters)
  }

  let parser: Parser
  let dateFormatter: NSDateFormatter

  public required init(parser: Parser) {
    self.parser = parser

    dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
  }

  public func generate(key: String) -> String {
    return parser.fetch(key)
  }

  // MARK: - Filling

  public func numerify(string: String) -> String {
    let count = UInt32(Constants.numbers.count)

    return String(string.characters.enumerate().map {
      (index, item) in
      let numberIndex = index == 0 ? arc4random_uniform(count - 1) :
        arc4random_uniform(count)
      let char = Constants.numbers[Int(numberIndex)]
      return String(item) == "#" ? char : item
      })
  }

  public func letterify(string: String) -> String {
    return String(string.characters.enumerate().map {
      (index, item) in
      let count = UInt32(Constants.uppercaseLetters.count)
      let char = Constants.uppercaseLetters[Int(arc4random_uniform(count))]
      return String(item) == "?" ? char : item
      })
  }

  public func bothify(string: String) -> String {
    return letterify(numerify(string))
  }

  public func alphaNumerify(string: String) -> String {
    return string.stringByReplacingOccurrencesOfString("[^A-Za-z0-9_]",
      withString: "",
      options: NSStringCompareOptions.RegularExpressionSearch,
      range: nil)
  }

  public func randomWordsFromKey(key: String) -> String {
    var string = ""

    var list = [String]()
    if let wordsList = parser.fetchRaw(key)?.arrayObject {
      for words in wordsList {
        if let item = (words as! [String]).random() {
          list.append(item)
        }
      }

      string = list.joinWithSeparator(" ")
    }

    return string
  }
}
