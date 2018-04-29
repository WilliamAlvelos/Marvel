//
//  Items.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Items: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kItemsResourceURIKey: String = "resourceURI"
	internal let kItemsNameKey: String = "name"


    // MARK: Properties
	public var resourceURI: String?
	public var name: String?



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
		resourceURI <- map[kItemsResourceURIKey]
		name <- map[kItemsNameKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if resourceURI != nil {
//            dictionary.updateValue(resourceURI!, forKey: kItemsResourceURIKey)
//        }
//        if name != nil {
//            dictionary.updateValue(name!, forKey: kItemsNameKey)
//        }
//
//        return dictionary
//    }

}
