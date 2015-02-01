//
//  AdminViewController.swift
//  ParseStarterProject
//
//  Created by Josiah Grace on 1/31/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit

class AdminViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            return UICollectionViewCell()
    }
}