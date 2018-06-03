//
//  LinuxRandomTests.swift
//  Fakery
//
//  Created by Brian Strobach on 6/2/18.
//

import XCTest
import Foundation
import SwiftTestUtils
import Fakery

class LinuxRandomTests: BaseTestCase {
	//MARK: Linux Testing
	static var allTests = [
		("testLinuxTestSuiteIncludesAllTests", testLinuxTestSuiteIncludesAllTests),
		("testRandomFunction", testRandomFunction),
		("testParser", testParser)
	]

	func testLinuxTestSuiteIncludesAllTests(){
		assertLinuxTestCoverage(tests: type(of: self).allTests)
	}

	func testRandomFunction() throws {

		XCTAssertNotNil(Random.int())
		let maxRandomInt: Int = 50
		let randomIntWithCeiling = Random.int(max: maxRandomInt)
		XCTAssert(randomIntWithCeiling <= maxRandomInt)
	}

	func testParser() throws {
		XCTAssertNoThrow(Faker().name.firstName())
		XCTAssertNoThrow(Faker().name.title())
		XCTAssertNoThrow(Faker().internet.domainName())
		XCTAssertNoThrow(Faker().business.creditCardNumber())

	}
}
