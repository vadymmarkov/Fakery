import Foundation

@objc public final class Lorem: Generator {
  @objc public func word() -> String {
    return generate("lorem.words")
  }

  @objc public func words(amount: Int = 3) -> String {
    var words: [String] = []

    for _ in 0..<amount {
      words.append(word())
    }

    return words.joined(separator: " ")
  }

  @objc public func character() -> String {
    return characters(amount: 1)
  }

  @objc public func characters(amount: Int = 255) -> String {
    var chars = ""

    if amount > 0 {
      for _ in 0..<amount {
        let char = Character(UnicodeScalar(arc4random() % (122-97) + 97)!)
        chars.append(char)
      }
    }

    return chars
  }

  @objc public func sentence(wordsAmount: Int = 4) -> String {
    var sentence = words(amount: wordsAmount) + "."
    sentence.replaceSubrange(sentence.startIndex...sentence.startIndex,
                          with: String(sentence[sentence.startIndex]).capitalized)
    return sentence
  }

  @objc public func sentences(amount: Int = 3) -> String {
    var sentences: [String] = []

    for _ in 0..<amount {
      sentences.append(sentence())
    }

    return sentences.joined(separator: " ")
  }

  @objc public func paragraph(sentencesAmount: Int = 3) -> String {
    return sentences(amount: sentencesAmount)
  }

  @objc public func paragraphs(amount: Int = 3) -> String {
    var paragraphs: [String] = []

    for _ in 0..<amount {
      paragraphs.append(paragraph())
    }

    return paragraphs.joined(separator: "\n")
  }
}
