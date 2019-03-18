//
//  LinuxMain.swift
//  
//
//  Created by Gustavo Campos on 3/16/19.
//

import XCTest
import Quick

@testable import FakeryTests

QCKMain([
    ConfigSpec.self,
    FakerSpec.self,
    ParserSpec.self,
    ProviderSpec.self,
    AddressSpec.self,
    AppSpec.self,
    BusinessSpec.self,
    CommerceSpec.self,
    CompanySpec.self,
    GeneratorSpec.self,
    InternetSpec.self,
    LoremSpec.self,
    NameSpec.self,
    NumberSpec.self,
    PhoneNumberSpec.self,
    TeamSpec.self,
    BankSpec.self,
    DateSpec.self
])
