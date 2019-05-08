//
//  Hobbit.swift
//  Fakery-iOS
//
//  Created by Jeroen de Vrind on 08/05/2019.
//  Copyright © 2019 Vadym Markov. All rights reserved.
//

import Foundation

public final class Hobbit: Generator {
  public func character() -> String {
    return generate("hobbit.character")
  }
  
  public func thorinsCompany() -> String {
    return generate("hobbit.thorins_company")
  }
  
  public func quote() -> String {
    return generate("hobbit.quote")
  }
  
  public func location() -> String {
    return generate("hobbit.location")
  }
}
