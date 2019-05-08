//
//  HobbitSpec.swift
//  Fakery-iOS
//
//  Created by Jeroen de Vrind on 08/05/2019.
//  Copyright © 2019 Vadym Markov. All rights reserved.
//

import Quick
import Nimble
@testable import Fakery

final class HobbitSpec: QuickSpec {
  override func spec() {
    describe("Hobbit") {
      var hobbit: Hobbit!

      beforeEach {
        let parser = Parser(locale: "en-TEST")
        hobbit = Hobbit(parser: parser)
      }

      describe("#character") {
        it("returns the correct text") {
          let character = hobbit.character()
          expect(character).to(equal("Bilbo Baggins"))
        }
      }

      describe("#thorins_company") {
        it("returns the correct text") {
          let thorinsCompany = hobbit.thorinsCompany()
          expect(thorinsCompany).to(equal("Thorin Oakenshield"))
        }
      }

      describe("#quote") {
        it("returns the correct text") {
          let quote = hobbit.quote()
          expect(quote).to(equal("Do you wish me a good morning, or mean that it is a good morning whether I want it or not; or that you feel good this morning; or that it is a morning to be good on?"))
        }
      }

      describe("#location") {
        it("returns the correct text") {
          let location = hobbit.location()
          expect(location).to(equal("Bree"))
        }
      }
    }
  }
}
