//
//  Thumbnail.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Thumbnail: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kThumbnailPathKey: String = "path"
	internal let kThumbnailExtensionKey: String = "extension"

    // MARK: Properties
	public var path: String?
	public var `extension`: String?

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(map: Map) {

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		path <- map[kThumbnailPathKey]
		`extension` <- map[kThumbnailExtensionKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if path != nil {
//            dictionary.updateValue(path!, forKey: kThumbnailPathKey)
//        }
//        if `extension` != nil {
//            dictionary.updateValue(`extension`!, forKey: kThumbnailExtensionKey)
//        }
//
//        return dictionary
//    }

}
