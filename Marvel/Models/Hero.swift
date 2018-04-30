//
//  Results.swift
//
//  Created by William Alvelos on 28/04/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Hero: Mappable {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kResultsSeriesKey: String = "series"
	internal let kResultsUrlsKey: String = "urls"
	internal let kResultsInternalIdentifierKey: String = "id"
	internal let kResultsEventsKey: String = "events"
	internal let kResultsResourceURIKey: String = "resourceURI"
	internal let kResultsStoriesKey: String = "stories"
	internal let kResultsDescriptionValueKey: String = "description"
	internal let kResultsThumbnailKey: String = "thumbnail"
	internal let kResultsModifiedKey: String = "modified"
	internal let kResultsComicsKey: String = "comics"
	internal let kResultsNameKey: String = "name"


    // MARK: Properties
	public var series: Series?
	public var urls: [Urls]?
	public var internalIdentifier: Int?
	public var events: Events?
	public var resourceURI: String?
	public var stories: Stories?
	public var descriptionValue: String?
	public var thumbnail: Thumbnail?
	public var modified: String?
	public var comics: Comics?
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
		series <- map[kResultsSeriesKey]
		urls <- map[kResultsUrlsKey]
		internalIdentifier <- map[kResultsInternalIdentifierKey]
		events <- map[kResultsEventsKey]
		resourceURI <- map[kResultsResourceURIKey]
		stories <- map[kResultsStoriesKey]
		descriptionValue <- map[kResultsDescriptionValueKey]
		thumbnail <- map[kResultsThumbnailKey]
		modified <- map[kResultsModifiedKey]
		comics <- map[kResultsComicsKey]
		name <- map[kResultsNameKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
//    public func dictionaryRepresentation() -> [String : AnyObject ] {
//
//        var dictionary: [String : AnyObject ] = [ : ]
//        if series != nil {
//            dictionary.updateValue(series!.dictionaryRepresentation(), forKey: kResultsSeriesKey)
//        }
//        if urls?.count > 0 {
//            var temp: [AnyObject] = []
//            for item in urls! {
//                temp.append(item.dictionaryRepresentation())
//            }
//            dictionary.updateValue(temp, forKey: kResultsUrlsKey)
//        }
//        if internalIdentifier != nil {
//            dictionary.updateValue(internalIdentifier!, forKey: kResultsInternalIdentifierKey)
//        }
//        if events != nil {
//            dictionary.updateValue(events!.dictionaryRepresentation(), forKey: kResultsEventsKey)
//        }
//        if resourceURI != nil {
//            dictionary.updateValue(resourceURI!, forKey: kResultsResourceURIKey)
//        }
//        if stories != nil {
//            dictionary.updateValue(stories!.dictionaryRepresentation(), forKey: kResultsStoriesKey)
//        }
//        if descriptionValue != nil {
//            dictionary.updateValue(descriptionValue!, forKey: kResultsDescriptionValueKey)
//        }
//        if thumbnail != nil {
//            dictionary.updateValue(thumbnail!.dictionaryRepresentation(), forKey: kResultsThumbnailKey)
//        }
//        if modified != nil {
//            dictionary.updateValue(modified!, forKey: kResultsModifiedKey)
//        }
//        if comics != nil {
//            dictionary.updateValue(comics!.dictionaryRepresentation(), forKey: kResultsComicsKey)
//        }
//        if name != nil {
//            dictionary.updateValue(name!, forKey: kResultsNameKey)
//        }
//
//        return dictionary
//    }

}
