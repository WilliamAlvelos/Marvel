//
//  MARVEL.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class MARVEL: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMARVELAttributionTextKey: String = "attributionText"
	internal let kMARVELAttributionHTMLKey: String = "attributionHTML"
	internal let kMARVELDataKey: String = "data"
	internal let kMARVELCodeKey: String = "code"
	internal let kMARVELCopyrightKey: String = "copyright"
	internal let kMARVELEtagKey: String = "etag"
	internal let kMARVELStatusKey: String = "status"


    // MARK: Properties
	public var attributionText: String?
	public var attributionHTML: String?
	public var data: Data?
	public var code: Int?
	public var copyright: String?
	public var etag: String?
	public var status: String?



    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		attributionText <- map[kMARVELAttributionTextKey]
		attributionHTML <- map[kMARVELAttributionHTMLKey]
		data <- map[kMARVELDataKey]
		code <- map[kMARVELCodeKey]
		copyright <- map[kMARVELCopyrightKey]
		etag <- map[kMARVELEtagKey]
		status <- map[kMARVELStatusKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if attributionText != nil {
//            dictionary.updateValue(attributionText!, forKey: kMARVELAttributionTextKey)
//        }
//        if attributionHTML != nil {
//            dictionary.updateValue(attributionHTML!, forKey: kMARVELAttributionHTMLKey)
//        }
//        if data != nil {
//            dictionary.updateValue(data!.dictionaryRepresentation(), forKey: kMARVELDataKey)
//        }
//        if code != nil {
//            dictionary.updateValue(code!, forKey: kMARVELCodeKey)
//        }
//        if copyright != nil {
//            dictionary.updateValue(copyright!, forKey: kMARVELCopyrightKey)
//        }
//        if etag != nil {
//            dictionary.updateValue(etag!, forKey: kMARVELEtagKey)
//        }
//        if status != nil {
//            dictionary.updateValue(status!, forKey: kMARVELStatusKey)
//        }
//
//        return dictionary
//    }

}
