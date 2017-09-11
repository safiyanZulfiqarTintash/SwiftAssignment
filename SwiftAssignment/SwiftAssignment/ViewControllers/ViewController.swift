//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var videosCollectionView: UICollectionView!
    var moviesArr: [MovieObject] = []
    var selectedMovie: MovieObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            self.callGetListOfMoviesAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"
        {
            (segue.destination as! DetailVC).movieObject = self.selectedMovie!
        }
    }
    
    // Mark: - API Calls
    func callGetListOfMoviesAPI () {
       
       MBProgressHUD.showAdded(to: self.view, animated: true)
        
        DataManager.shared.fetchData(){
            (movies:[MovieObject]?, error: NSError?) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                if let movies = movies {
                    self.moviesArr = movies
                    // Sorting on basis of Rating ------------
                    self.moviesArr =  self.moviesArr.sorted(by: { $0.rating > $1.rating })
                    self.videosCollectionView.reloadData()
                }
            }
            
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }
        
    }
}

// Mark: - UICollectionView Delegate and DataSource
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.moviesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        let movieObject: MovieObject = self.moviesArr[indexPath.row]
        cell.setCellData(movieObject)
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenFrame = UIScreen.main.bounds
        return CGSize(width: screenFrame.size.width/2 , height: 211);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedMovie = self.moviesArr[indexPath.row]
        self.performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
}


