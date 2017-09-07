//
//  QualityObject.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import ObjectMapper

@objc class QualityObject: NSObject, Mappable {
    var quality: String?
    var url: String?
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        quality <- map["quality"]
        url <- map["url"]
        
    }
}
