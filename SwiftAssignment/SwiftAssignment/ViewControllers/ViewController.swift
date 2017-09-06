//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Safiyan Zulfiqar on 06/09/2017.
//  Copyright © 2017 Safiyan Zulfiqar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        
    DataManager.shared.fetchData(){
        (movies:[MovieObject]?, error: NSError?) in
            
            if let error = error
            {
                print(error.localizedDescription)
            }
            else
            {
                if let movies = movies
                {
                    print (movies[0].skyGoUrl!)
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

