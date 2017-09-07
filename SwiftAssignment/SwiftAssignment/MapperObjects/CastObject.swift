//
//  CastObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 07/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper


@objc class CastObject:NSObject, Mappable {
    var name: String?
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}
