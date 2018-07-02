//
//  Events.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Events: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kEventsCollectionURIKey: String = "collectionURI"
	internal let kEventsAvailableKey: String = "available"
	internal let kEventsItemsKey: String = "items"
	internal let kEventsReturnedKey: String = "returned"

    // MARK: Properties
	public var collectionURI: String?
	public var available: Int?
	public var items: [Items]?
	public var returned: Int?

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
		collectionURI <- map[kEventsCollectionURIKey]
		available <- map[kEventsAvailableKey]
		items <- map[kEventsItemsKey]
		returned <- map[kEventsReturnedKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if collectionURI != nil {
//            dictionary.updateValue(collectionURI!, forKey: kEventsCollectionURIKey)
//        }
//        if available != nil {
//            dictionary.updateValue(available!, forKey: kEventsAvailableKey)
//        }
//        if items?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in items! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kEventsItemsKey)
//        }
//        if returned != nil {
//            dictionary.updateValue(returned!, forKey: kEventsReturnedKey)
//        }
//
//        return dictionary
//    }

}
