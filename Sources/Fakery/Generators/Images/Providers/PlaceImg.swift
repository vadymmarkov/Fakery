//
//  PlaceImg.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation

public enum PlaceIMGImageCategory {
	case animals
	case architecture
	case nature
	case people
	case tech
}

public enum PlaceIMGImageEffect {
	case sepia
	case grayscale
}

public class PlaceImgURLBuilder: ImageProviderURLBuilder{
	public var category: PlaceIMGImageCategory?
	public var effect: PlaceIMGImageEffect?
	public init(category: PlaceIMGImageCategory? = nil, effect: PlaceIMGImageEffect? = nil){
		self.category = category
		self.effect = effect
	}

	public func urlString(width: Int, height: Int) -> String {
		var url = "https://placeimg.com/\(width)/\(height)"
		if let category = category{
			url += "/\(category)"
		}
		else {
			url += "/any"
		}
		if let effect = effect{
			url += "/\(effect)"
		}
		return url
	}
}

extension ImageProviderURLBuilder{
	public static func placeImg(category: PlaceIMGImageCategory? = nil,
								effect: PlaceIMGImageEffect? = nil) -> PlaceImgURLBuilder{
		return PlaceImgURLBuilder(category: category, effect: effect)
	}
}
