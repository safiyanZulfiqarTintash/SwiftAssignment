//
//  VideoCollectionCell.swift
//  SwiftAssignment
//
//  Created by Safiyan Zulfiqar on 07/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class VideoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.autoresizingMask = UIViewAutoresizing.flexibleHeight
    }
    
    
    func setCellData(_ movieObject: MovieObject)
    {
        if let year = movieObject.year
        {
            self.lblYear.text = "\(year)"
        }
        if let heading = movieObject.headline
        {
            self.lblTitle.text = heading
        }
//        if let rating = movieObject.rating
//        {
            self.lblRating.text = "\(movieObject.rating)"
       // }
//        else
//        {
//            self.lblRating.text = ""
//        }
        if let urlStr = movieObject.keyArtImages?[0].url
        {
            let url = URL(string: urlStr)!
            self.imgView.image = UIImage(named:"placeholder.png")
            self.imgView.contentMode = UIViewContentMode.scaleAspectFill
            self.imgView.clipsToBounds = true
            Alamofire.request(url, method: .get).responseImage { response in
                guard let image = response.result.value else {
                    // Handle error
                    return
                }
                // Do stuff with your image
                self.imgView.image = image;
                
                
            }
            
        }
        
        
    }
    
}
