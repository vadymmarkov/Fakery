import Quick
import Nimble
@testable import Fakery

final class InternetSpec: QuickSpec {
  override func spec() {
    describe("Internet") {
      let emailFormat = "[\\w._%+-]+@[\\w.-]+\\.\\w{2,}"
      var internet: Internet!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        internet = Internet(parser: parser)
      }

      describe("#username") {
        context("without separator - by default") {
          it("returns the correct text") {
            let username = internet.username()
            expect(username).to(match("^[A-Za-z]+(\\d+)?$"))
          }
        }

        context("with provided separator") {
          it("returns the correct text") {
            let username = internet.username(separator: "_")
            if username.lengthOfBytes(using: String.Encoding.utf8) > 5 {
              expect(username.contains("_")).notTo(beNil())
            } else {
              expect(username.contains("_")).to(beNil())
            }
          }
        }

        it("doesn't have the ' symbol in the result") {
          let username = internet.username(separator: "'_'")
          expect(username.contains("'")).to(beFalse())
        }
      }

      describe("#domainName") {
        it("returns the correct text") {
          let domainName = internet.domainName()
          expect(domainName).to(equal("markov.com"))
        }
      }

      describe("#domainWord") {
        it("returns the correct text") {
          let domainWord = internet.domainWord()
          expect(domainWord).to(equal("markov"))
        }
      }

      describe("#domainSuffix") {
        it("returns the correct text") {
          let domainSuffix = internet.domainSuffix()
          expect(domainSuffix).to(equal("com"))
        }
      }

      describe("#email") {
        it("returns the correct email address") {
          let email = internet.email()
          expect(email).to(match(emailFormat))
        }
      }

      describe("#freeEmail") {
        it("returns the correct email address") {
          let freeEmail = internet.freeEmail()
          expect(freeEmail).to(match(emailFormat))
          expect(freeEmail).to(match("^[\\w._%+-]+@gmail.com$"))
        }
      }

      describe("#safeEmail") {
        it("returns the correct email address") {
          let safeEmail = internet.safeEmail()
          expect(safeEmail).to(match(emailFormat))
          expect(safeEmail).to(match("^[\\w._%+-]+@example.(org|com|net)$"))
        }
      }

      describe("#password") {
        context("without min and max - 8...16 by default") {
          it("returns the correct password") {
            let password = internet.password()
            let length = password.lengthOfBytes(using: String.Encoding.utf8)
            expect(length >= 8 && length <= 16).to(beTrue())
          }
        }

        context("with provided min length and max length") {
          it("returns the correct password when min = max") {
            let password = internet.password(minimumLength: 3, maximumLength: 3)
            let length = password.lengthOfBytes(using: String.Encoding.utf8)
            expect(length == 3).to(beTrue())
          }

          it("returns the correct password when min > max") {
            let password = internet.password(minimumLength: 3, maximumLength: 4)
            let length = password.lengthOfBytes(using: String.Encoding.utf8)
            expect(length >= 3 && length <= 4).to(beTrue())
          }

          it("returns the correct password when min < max") {
            let password = internet.password(minimumLength: 4, maximumLength: 3)
            let length = password.lengthOfBytes(using: String.Encoding.utf8)
            expect(length == 4).to(beTrue())
          }
        }
      }

      describe("#ipV4Address") {
        it("returns the correct text") {
          let ipV4Address = internet.ipV4Address()
          expect(ipV4Address).to(match(
            "((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])"))
        }
      }

      describe("#ipV6Address") {
        it("returns the correct text") {
          let ipV6Address = internet.ipV6Address()
          expect(ipV6Address).to(match(
            "^([0-9A-Fa-f]{0,4}:){2,7}([0-9A-Fa-f]{1,4}$|((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\\.|$)){4})"))
        }
      }

      describe("#url") {
        it("returns the correct URL") {
          let url = internet.url()
          expect(url).to(match("^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"))
        }
      }

      describe("#image") {
        it("returns the correct Image URL with default size") {
          let url = internet.image()
          expect(url).to(equal("https://lorempixel.com/320/200"))
        }

        it("returns the correct Image URL with a specified size") {
          let url = internet.image(width: 200, height: 150)
          expect(url).to(equal("https://lorempixel.com/200/150"))
        }
      }

      describe("#templateImage") {
        it("returns the correct Image URL with defaults") {
          let url = internet.templateImage()
          expect(url).to(equal("https://dummyimage.com/320x200/000000/ffffff"))
        }

        it("returns the correct Image URL with a specified size") {
          let url = internet.templateImage(width: 200, height: 150,
            backColorHex: "2e4bc2", frontColorHex: "ccdb28")
          expect(url).to(equal("https://dummyimage.com/200x150/2e4bc2/ccdb28"))
        }
      }

      describe("#hashtag") {
        it("returns the correct hashtag") {
          let hashtag = internet.hashtag()
          expect(hashtag).to(equal("#art"))
        }
      }
    }
  }
}
