//
//  AdorableAvatars.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation

public enum AdorableAvatarVersion{
	case original, new
}
public class AdorableAvatarImageURLBuilder: ImageProviderURLBuilder{
	public var username: String
	public var version: AdorableAvatarVersion
    public init(username: String = Faker().internet.username(), version: AdorableAvatarVersion = .new) {
        self.username = username
		self.version = version
    }

	public func urlString(width: Int = 400, height: Int = 400) -> String {
		let size = max(width, height)
		let pixels = min(size, 400)
		return "https://api.adorable.io/avatar\(version == .new ? "s" : "")/\(pixels)/\(username)"		
	}
}
