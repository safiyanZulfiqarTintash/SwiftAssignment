//
//  NetworkManager.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

final class NetworkManager {
    
    // Can't init is singleton
    private init() { }
    
    // MARK: Shared Instance
    
    static let shared = NetworkManager()
    
    // MARK: Local Variable
    
    func fetchDataFromServer(completionHander:
        @escaping ( _ movieData:[MovieObject]?, _ error :NSError?) -> Void)
    {
        let URL = "http://s3.amazonaws.com/vodassets/showcase.json"
        
        Alamofire.request(URL)
            .responseArray
            { (response: DataResponse<[MovieObject]>) in
            
                switch response.result {
                    case .success:
                        if let arrMovieObject = response.result.value {
                            completionHander(arrMovieObject , nil)
                        }
                    
                    case .failure(let error):
                        completionHander(nil , error as NSError)
                    
                    }
        }
    }
}


