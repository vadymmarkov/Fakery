//
//  LinuxRandom.swift
//  Fakery
//
//  Created by Brian Strobach on 6/2/18.
//

import Foundation

public class Random{

	#if os(Linux)
	static var initialized = false
	#endif

	static public func int(range: CountableClosedRange<Int> ) -> Int{
		var offset = 0

		if range.lowerBound < 0   // allow negative ranges
		{
			offset = abs(range.lowerBound)
		}

		let min = range.lowerBound + offset
		let max = range.upperBound   + offset

		#if os(Linux)
		seedRandom()
		return Int((random() % max) + min) - offset
		#else
		return Int(UInt32(min) + arc4random_uniform(UInt32(max) - UInt32(min))) - offset
		#endif

	}
	static public func int(max: Int) -> Int {
		#if os(Linux)
		seedRandom()
		return Int(random() % max)
		#else
		return Int(arc4random_uniform(UInt32(max)))
		#endif
	}


	static public func int() -> Int{
		#if os(Linux)
		seedRandom()
		return Int(random())
		#else
		return Int(arc4random())
		#endif
	}

	#if os(Linux)
	static public func seedRandom(){
		if !Random.initialized {
			srandom(UInt32(time(nil)))
			Random.initialized = true
		}
	}
	#endif
}
