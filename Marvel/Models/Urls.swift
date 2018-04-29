//
//  Urls.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Urls: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kUrlsUrlKey: String = "url"
	internal let kUrlsTypeKey: String = "type"


    // MARK: Properties
	public var url: String?
	public var type: String?



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
		url <- map[kUrlsUrlKey]
		type <- map[kUrlsTypeKey]
    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if url != nil {
//            dictionary.updateValue(url!, forKey: kUrlsUrlKey)
//        }
//        if type != nil {
//            dictionary.updateValue(type!, forKey: kUrlsTypeKey)
//        }
//
//        return dictionary
//    }

}
