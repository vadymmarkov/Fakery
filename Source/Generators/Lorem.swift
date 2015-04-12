public class Lorem: Generator {

    public func word() -> String {
        return generate("lorem.words")
    }

    public func words(amount: Int = 3) -> String {

        var words: [String] = []
        for index in 0..<amount {
            words.append(word())
        }

        return " ".join(words)
    }
}
