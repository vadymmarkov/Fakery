//
//  Cat.swift
//  Fakery
//
//  Created by Sida Nakrosyte on 08/05/2019.
//  Copyright © 2019 Vadym Markov. All rights reserved.
//

import Foundation

public final class Cat: Generator {
  public func name() -> String {
    return generate("cat.name")
  }

  public func breed() -> String {
    return generate("cat.breed")
  }

  public func registry() -> String {
    return generate("cat.registry")
  }
}
