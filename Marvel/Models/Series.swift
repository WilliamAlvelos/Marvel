//
//  Series.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Series: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kSeriesCollectionURIKey: String = "collectionURI"
	internal let kSeriesAvailableKey: String = "available"
	internal let kSeriesItemsKey: String = "items"
	internal let kSeriesReturnedKey: String = "returned"


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
    required public init?(map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		collectionURI <- map[kSeriesCollectionURIKey]
		available <- map[kSeriesAvailableKey]
		items <- map[kSeriesItemsKey]
		returned <- map[kSeriesReturnedKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if collectionURI != nil {
//            dictionary.updateValue(collectionURI!, forKey: kSeriesCollectionURIKey)
//        }
//        if available != nil {
//            dictionary.updateValue(available!, forKey: kSeriesAvailableKey)
//        }
//        if items?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in items! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kSeriesItemsKey)
//        }
//        if returned != nil {
//            dictionary.updateValue(returned!, forKey: kSeriesReturnedKey)
//        }
//
//        return dictionary
//    }

}
