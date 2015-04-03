import Foundation

public class Generator
{
    public struct Constants {
        public static let uppercaseLetters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        public static let numbers = Array(arrayLiteral: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
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
        var replaced = String(map(string.generate()) {
            $0 == "#" ? string["\(arc4random_uniform(10))".startIndex] : $0
        })
        return "\(arc4random_uniform(9) + 1)\(dropFirst(replaced))"
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
