//
//  ImageProviderURLBuilder.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation

public protocol ImageProviderURLBuilder{
	func urlString(width: Int, height: Int) -> String
	func url(width: Int, height: Int) -> URL
}
public extension ImageProviderURLBuilder{

	public func urlString(width: Int = 640, height: Int = 480) -> String{
		assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
		return ""
	}

	public func url(width: Int = 640, height: Int = 480) -> URL{
		return URL(string: urlString(width: width, height: height))!
	}
}
