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
	public var heroes: [Hero]?
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
		heroes <- map[kDataResultsKey]
		total <- map[kDataTotalKey]
		offset <- map[kDataOffsetKey]
		count <- map[kDataCountKey]

    }

}
