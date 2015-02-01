//
//  AdminViewController.swift
//  ParseStarterProject
//
//  Created by Josiah Grace on 1/31/15.
//  Copyright (c) 2015 Parse. All rights reserved.
//

import Foundation
import UIKit
import Parse

class AdminViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myAdminCollectionView: UICollectionView!
    
    @IBOutlet weak var adminImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myAdminCollectionView.delegate = self
        self.myAdminCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    

            //Sets up cell
            func collectionView(collectionView: UICollectionView,
                cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

                    let cell:ClothingCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as ClothingCell
                    
                    if indexPath.row % 2 == 0{
                        cell.backgroundColor = UIColor.blueColor()
                    }
                    else{
                        cell.backgroundColor = UIColor.whiteColor()
                    }
                    
                    //cell.myButton.addTarget(self, action: "btnTouched:", forControlEvents: UIControlEvents.TouchUpInside)
                    cell.setCell("Black Pants", clothingImageFilename: "BlackPants.jpg")
                    cell.layer.cornerRadius = 7
                    //ALL BELOW FOR COLOR BORDER
                    //cell.layer.masksToBounds = true
                    //cell.layer.borderWidth = 4
                    //cell.layer.borderColor = (UIColor(red:1.0, green:196/255, blue: 110/255, alpha: 1.0)).CGColor
                    //cell.layer.shadowColor = (UIColor(red:245/255, green:166/255, blue: 30/255, alpha: 1.0)).CGColor
                    //cell.layer.shadowOffset = CGSizeMake(8, 0)
                    //cell.layer.shadowOpacity = 1.0
                    //cell.layer.shadowRadius = 7
                    
                    
                    return cell
                    
            }
 
    func collectionView(collectionView: UICollectionView,
        shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool{
            return true
    }
    
    func collectionView(collectionView: UICollectionView,
        canPerformAction action: Selector,
        forItemAtIndexPath indexPath: NSIndexPath,
        withSender sender: AnyObject!) -> Bool{
            return true
    }
    
    func collectionView(collectionView: UICollectionView,
        performAction action: Selector,
        forItemAtIndexPath indexPath: NSIndexPath,
        withSender sender: AnyObject!){
            //rightImage.image = UIImage(named: "BlackPants.jpg")
    }
    
}