//
//  HomeViewModel.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 23/02/2018.
//  Copyright © 2018 Safiyan Zulfiqar. All rights reserved.
//

import Foundation

class HomeViewModel {
    var moviesArr: [MovieObject] = []
    var selectedMovie: MovieObject?
    var errorMessage: String?
}

// Mark: - API Calls
extension HomeViewModel {
    func callGetListOfMoviesAPI (completionHandler: @escaping () -> Void) {
        DataManager.shared.fetchData() {
            (movies:[MovieObject]?, error: NSError?) in
            if let error = error {
                self.errorMessage = error.localizedDescription
                
            }
            else {
                if let movies = movies {
                    self.moviesArr = movies
                    // Sorting on basis of Rating ------------
                    self.moviesArr =  self.moviesArr.sorted(by: { $0.rating > $1.rating })
                }
            }
            completionHandler()
        }
    }
}
