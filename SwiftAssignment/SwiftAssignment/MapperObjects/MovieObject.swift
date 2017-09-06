//
//  MovieObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieObject: Mappable {
    var skyGoUrl: String?
    var url: String?
    var reviewAuthor : String?
    var id : String?
    var cert : String?
    var headline : String?
    var cardImages: [CardObject]?
    var videos : [VideoObject]?
    
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
        cardImages <- map["cardImages"]
        videos <- map["videos"]
        
        
    }
}

