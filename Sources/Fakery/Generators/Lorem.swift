import Foundation

public final class Lorem: Generator {
  public func word() -> String {
    return generate("lorem.words")
  }

  public func words(amount: Int = 3) -> String {
    var words: [String] = []

    for _ in 0..<amount {
      words.append(word())
    }

    return words.joined(separator: " ")
  }

  public func character() -> String {
    return characters(amount: 1)
  }

  public func characters(amount: Int = 255) -> String {
    var chars = ""

    if amount > 0 {
      for _ in 0..<amount {
        let char = Character(UnicodeScalar(arc4random() % (122-97) + 97)!)
        chars.append(char)
      }
    }

    return chars
  }

  public func sentence(wordsAmount: Int = 4) -> String {
    var sentence = words(amount: wordsAmount) + "."
    sentence.replaceSubrange(sentence.startIndex...sentence.startIndex,
                          with: String(sentence[sentence.startIndex]).capitalized)
    return sentence
  }

  public func sentences(amount: Int = 3) -> String {
    var sentences: [String] = []

    for _ in 0..<amount {
      sentences.append(sentence())
    }

    return sentences.joined(separator: " ")
  }

  public func paragraph(sentencesAmount: Int = 3) -> String {
    return sentences(amount: sentencesAmount)
  }

  public func paragraphs(amount: Int = 3) -> String {
    var paragraphs: [String] = []

    for _ in 0..<amount {
      paragraphs.append(paragraph())
    }

    return paragraphs.joined(separator: "\n")
  }
}
