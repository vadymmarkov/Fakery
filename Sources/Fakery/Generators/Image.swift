//
//  Image.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation
import Foundation

public enum LoremPixelImageCategory : String {
	case abstract = "abstract"
	case animals = "animals"
	case business = "business"
	case cats = "cats"
	case city = "city"
	case food = "food"
	case nightlife = "nightlife"
	case fashion = "fashion"
	case people = "people"
	case nature = "nature"
	case sports = "sports"
	case technics = "technics"
	case transport = "transport"
}

public enum LoremFlickrKeywordStrategy{
	case all, any
}

public final class Image: Generator {
	private let lorem: Lorem

	public required init(parser: Parser) {
		self.lorem = Lorem(parser: parser)
		super.init(parser: parser)
	}
	
	/// Returns an image from lorempixel.com based on size and category parameters.
	///
	/// - Parameters:
	///   - width: The width of the image to create.
	///   - height: The height of the image to create.
	///   - category: The category of picture to return.
	/// - Returns: An image url string
	public func random(width: Int = 640, height: Int = 480, category: LoremPixelImageCategory? = nil) -> String {
		var url = "http://lorempixel.com/\(width)/\(height)/"
		if (category != nil) {
			url += "\(category!.rawValue)"
		}
		return url
	}



	/// Returns an image from loremflickr.com based on size and search keyword parameters.
	///
	/// - Parameters:
	///   - width: The width of the image to create.
	///   - height: The height of the image to create.
	///   - lock: An integer that will identify and lock the image if used repeatedly (until cache clears).
	///   - keywordStrategy: Whether to match on all or any keywords.
	///   - keywords: Keywords to guide image content.
	/// - Returns: An image url string
	public func random(width: Int = 640, height: Int = 480, lock: Int? = nil, keywordStrategy: LoremFlickrKeywordStrategy = .all, keywords: String...) -> String {
		var url = "http://loremflickr.com/\(width)/\(height)/"
		for keyword in keywords{
			url += keyword + ","
		}
		if url.last == ","{
			url.removeLast()
		}

		if keywords.count > 1 && keywordStrategy == .all{
			url += "/all"
		}

		if let lock = lock{
			url += "?lock=\(lock)"
		}
		return url
	}

	/// Return a random avatar of the give `size` for a given `username`. (the same username with yield the same avatar)
	///
	/// - Parameters:
	///   - username: The username to generate the avatar for.
	///   - size: The size (in pixels) of the avatar (both height and width).
	/// - Returns: Random avatare image url string.
	public func avatar(username : String? = nil,size : Int = 256) -> String {
		let user   = username ?? Faker().internet.username()
		let pixels = size > 400 ? 400 : size
		let url    = "http://api.adorable.io/avatars/\(pixels)/\(user)"
		return url
	}


	public func templateImage(width: Int = 320, height: Int = 200,
							  backColorHex: String = "000000", frontColorHex: String = "ffffff") -> String {
		return "https://dummyimage.com/\(width)x\(height)/\(backColorHex)/\(frontColorHex)"
	}
}
