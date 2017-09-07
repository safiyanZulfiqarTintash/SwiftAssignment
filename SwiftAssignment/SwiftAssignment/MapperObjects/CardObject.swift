//
//  CardObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper


@objc class CardObject:NSObject, Mappable {
    var url: String?
    var height: Int?
    var width: Int?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        height <- map["h"]
        width <- map["w"]
    }
}
