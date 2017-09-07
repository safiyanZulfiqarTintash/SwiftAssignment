//
//  VideoObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper

@objc class VideoObject:NSObject, Mappable {
    var title: String?
    var alternatives: [QualityObject]?
    var type: String?
    var url: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        alternatives <- map["alternatives"]
        type <- map["type"]
        url <- map["url"]
    }
}
