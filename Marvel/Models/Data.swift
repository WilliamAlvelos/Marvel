//
//  Data.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Data: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDataLimitKey: String = "limit"
	internal let kDataResultsKey: String = "results"
	internal let kDataTotalKey: String = "total"
	internal let kDataOffsetKey: String = "offset"
	internal let kDataCountKey: String = "count"


    // MARK: Properties
	public var limit: Int?
	public var results: [Results]?
	public var total: Int?
	public var offset: Int?
	public var count: Int?



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
		limit <- map[kDataLimitKey]
		results <- map[kDataResultsKey]
		total <- map[kDataTotalKey]
		offset <- map[kDataOffsetKey]
		count <- map[kDataCountKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if limit != nil {
//            dictionary.updateValue(limit!, forKey: kDataLimitKey)
//        }
//        if results?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in results! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kDataResultsKey)
//        }
//        if total != nil {
//            dictionary.updateValue(total!, forKey: kDataTotalKey)
//        }
//        if offset != nil {
//            dictionary.updateValue(offset!, forKey: kDataOffsetKey)
//        }
//        if count != nil {
//            dictionary.updateValue(count!, forKey: kDataCountKey)
//        }
//
//        return dictionary
//    }

}
