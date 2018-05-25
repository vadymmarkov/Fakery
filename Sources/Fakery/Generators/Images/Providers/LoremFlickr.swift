//
//  LoremFlickr.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation

public enum LoremFlickrKeywordStrategy{
	case all, any
}

public class LoremFlickrURLBuilder: ImageProviderURLBuilder{
	public var keywordStrategy: LoremFlickrKeywordStrategy
	public var keywords: [String]?
	public var lock: Int?
	public init(keywordStrategy: LoremFlickrKeywordStrategy = .any,
				keywords: [String]? = nil,
				lock: Int? = nil){
		self.keywordStrategy = keywordStrategy
		self.keywords = keywords
		self.lock = lock
	}

	public func urlString(width: Int = 640, height: Int = 480) -> String {
			var url = "https://loremflickr.com/\(width)/\(height)/"

			if let keywords = keywords{
				for keyword in keywords{
					url += keyword + ","
				}
				if url.last == ","{
					url.removeLast()
				}

				if keywords.count > 1 && keywordStrategy == .all{
					url += "/all"
				}
			}

			if let lock = lock{
				url += "?lock=\(lock)"
			}
			return url
	}
}

extension ImageProviderURLBuilder{
	public static func loremFlickr(keywordStrategy: LoremFlickrKeywordStrategy = .any,
								   keywords: [String]? = nil,
								   lock: Int? = nil) -> LoremFlickrURLBuilder{
		return LoremFlickrURLBuilder(keywordStrategy: keywordStrategy, keywords: keywords, lock: lock)
	}
}
