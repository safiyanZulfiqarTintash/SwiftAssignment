//
//  MovieObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper

@objc class MovieObject: NSObject, Mappable  {
    var skyGoUrl: String?
    var url: String?
    var reviewAuthor : String?
    var id : String?
    var cert : String?
    var headline : String? // cell title
    var synopsis : String?
    var body : String?
    var year : String? // cell subtitle
    var duration : Int?
    var rating : Int = 0
    var cardImages: [CardObject]?
    var videos : [VideoObject]?
    var casts : [CastObject]?
    var genres : [String]?
    var keyArtImages : [CardObject]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map) {
        skyGoUrl <- map["skyGoUrl"]
        url <- map["url"]
        reviewAuthor <- map["reviewAuthor"]
        id <- map["id"]
        cert <- map["cert"]
        headline <- map["headline"]
        synopsis <- map["synopsis"]
        body <- map["body"]
        year <- map["year"]
        duration <- map["duration"]
        cardImages <- map["cardImages"]
        videos <- map["videos"]
        casts <- map["cast"]
        genres <- map["genres"]
        rating <- map["rating"]
        keyArtImages <- map["keyArtImages"]
        
        
        
    }
}

