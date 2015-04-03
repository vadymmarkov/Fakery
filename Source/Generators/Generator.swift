import Foundation

public class Generator
{
    public struct Constants {
        public static let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let numbers = Array("0123456789")
    }

    public class var parser: Parser {
        return Parser.sharedInstance
    }

    public class func generate(key: String) -> String
    {
        return parser.parseKey(key)
    }

    // MARK: - Filling

    public class func numerify(string: String) -> String
    {
        let count = UInt32(Constants.numbers.count)
        var replaced = String(map(string.generate()) {
            let char = Constants.numbers[Int(arc4random_uniform(count))]
            return $0 == "#" ? char : $0
        })
        var result = replaced
        if replaced[replaced.startIndex] == "0" {
            let char = Constants.numbers[Int(arc4random_uniform(count - 1) + 1)]
            result = "\(char)\(dropFirst(replaced))"
        }

        return result
    }

    public class func letterify(string: String) -> String
    {
        return String(map(string.generate()) {
            let count = UInt32(Constants.uppercaseLetters.count)
            let char = Constants.uppercaseLetters[Int(arc4random_uniform(count))]
            return $0 == "?" ? char : $0
        })
    }

    public class func bothify(string: String) -> String
    {
        return letterify(numerify(string))
    }
}
