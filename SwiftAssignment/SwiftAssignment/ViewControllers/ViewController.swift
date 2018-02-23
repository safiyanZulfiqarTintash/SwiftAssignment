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
    
    fileprivate var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callGetListOfMoviesAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Mark: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail"
        {
            (segue.destination as! DetailVC).movieObject = self.viewModel.selectedMovie!
        }
    }
    
    // Mark: - API Calls
    func callGetListOfMoviesAPI () {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        viewModel.callGetListOfMoviesAPI {
            DispatchQueue.main.async {
                if let error = self.viewModel.errorMessage {
                    print (error)
                } else {
                    self.videosCollectionView.reloadData()
                }
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }
    }
}

// Mark: - UICollectionView Delegate and DataSource
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.moviesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        let movieObject: MovieObject = viewModel.moviesArr[indexPath.row]
        cell.setCellData(movieObject)
        return cell;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenFrame = UIScreen.main.bounds
        return CGSize(width: screenFrame.size.width/2 , height: 211);
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectedMovie = viewModel.moviesArr[indexPath.row]
        self.performSegue(withIdentifier: "ShowDetail", sender: nil)
    }
    
}


