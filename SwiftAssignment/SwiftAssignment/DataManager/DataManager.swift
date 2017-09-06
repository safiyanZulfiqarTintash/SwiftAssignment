//
//  DataManager.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation

final class DataManager {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = DataManager()
    
    
    func fetchData(completionHander:
        @escaping (_ movieData:[MovieObject]?,_ error :NSError?) -> Void)
    {
        NetworkManager.shared.fetchDataFromServer() {(movies:[MovieObject]?, error: NSError?) in
            completionHander(movies, error)
        }

    }

}
