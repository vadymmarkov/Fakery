//
//  Image.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation
import Foundation

public enum LoremFlickrKeywordStrategy{
	case all, any
}

public final class Image: Generator {
	private let lorem: Lorem

	public required init(parser: Parser) {
		self.lorem = Lorem(parser: parser)
		super.init(parser: parser)
	}


	/// Returns an image url string from loremflickr.com based on size and search keyword parameters.
	///
	/// - Parameters:
	///   - width: The width of the image to create.
	///   - height: The height of the image to create.
	///   - lock: An integer that will identify and lock the image if used repeatedly (until cache clears).
	///   - keywordStrategy: Whether to match on all or any keywords.
	///   - keywords: Keywords to guide image content.
	/// - Returns: An image url string
	public func random(width: Int = 640, height: Int = 480, lock: Int? = nil, keywordStrategy: LoremFlickrKeywordStrategy = .all, keywords: [String]? = nil) -> String {
		var url = "http://loremflickr.com/\(width)/\(height)/"

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

	/// Returns an image url from loremflickr.com based on size and search keyword parameters.
	///
	/// - Parameters:
	///   - width: The width of the image to create.
	///   - height: The height of the image to create.
	///   - lock: An integer that will identify and lock the image if used repeatedly (until cache clears).
	///   - keywordStrategy: Whether to match on all or any keywords.
	///   - keywords: Keywords to guide image content.
	/// - Returns: An image url string
	public func randomURL(width: Int = 640, height: Int = 480, lock: Int? = nil, keywordStrategy: LoremFlickrKeywordStrategy = .all, keywords: [String]? = nil) -> URL {
		return random(width: width, height: height, lock: lock, keywordStrategy: keywordStrategy, keywords: keywords).toURL()
	}

	/// Return a random url string for an avatar of the given `size` for a given `username`. (the same username with yield the same avatar)
	///
	/// - Parameters:
	///   - username: The username to generate the avatar for.
	///   - size: The size (in pixels) of the avatar (both height and width).
	/// - Returns: Random avatar image url string.
	public func avatar(username : String? = nil,size : Int = 256) -> String {
		let user   = username ?? Faker().internet.username()
		let pixels = size > 400 ? 400 : size
		let url    = "http://api.adorable.io/avatars/\(pixels)/\(user)"
		return url
	}

	/// Return a random url for an avatar of the give `size` for a given `username`. (the same username with yield the same avatar)
	///
	/// - Parameters:
	///   - username: The username to generate the avatar for.
	///   - size: The size (in pixels) of the avatar (both height and width).
	/// - Returns: Random avatar image url.
	public func avatarURL(username : String? = nil,size : Int = 256) -> URL {
		return avatar(username: username, size: size).toURL()
	}

	public func templateImage(width: Int = 320, height: Int = 200,
							  backColorHex: String = "000000", frontColorHex: String = "ffffff") -> String {
		return "https://dummyimage.com/\(width)x\(height)/\(backColorHex)/\(frontColorHex)"
	}
}

fileprivate extension String{
	fileprivate func toURL() -> URL{
		return URL(string: self)!
	}
}
