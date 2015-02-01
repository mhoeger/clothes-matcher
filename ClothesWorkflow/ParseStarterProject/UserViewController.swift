//
//  ViewController.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 10/20/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//
import UIKit
import Foundation
import Parse

class UserViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    let USERNAME = "josiah"
    
    private struct ClothesStore {
        var clothesArray:[AnyObject] = []
    }
    private var myStore = ClothesStore()

    
    var clothesArray: [Clothing] = [Clothing]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadClothing()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /**
        Load a UserView list of clothing items for this particular user. 
        TODO: Do this cleverly with local datastore and caching
    */
    func loadClothing() {
        var query = PFQuery(className: "ClothingItem")
        query.whereKey("user", equalTo: USERNAME)
        query.findObjectsInBackgroundWithBlock {
            (clothesStore: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                self.myCollectionView.reloadData()
                self.myStore.clothesArray = clothesStore
                println("Successfully retrieved \(clothesStore.count) scores.")
            } else {
                println("Error: %@ %@", error, error.userInfo!)
            }
        }
    }
    
    //The number of items displayed in the collection
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.myStore.clothesArray.count
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    
    //Action after selecting item
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            let currentCell:ClothingCell = collectionView.cellForItemAtIndexPath(indexPath) as ClothingCell
            rightImage.image = UIImage(named:"BlackPants.jpg")
            leftImage.image = currentCell.clothingImage!.image
    }
    
    /**
    END SELECT TESTS**/

    
    /**
    START ACTION TESTS
    
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
            rightImage.image = UIImage(named: "BlackPants.jpg")
    }
    
    
    END ACTION TESTS
    **/
    
    //Sets up cell
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            
        let cell:ClothingCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as ClothingCell
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.blueColor()
        }
        else {
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        let clothing:AnyObject = myStore.clothesArray[indexPath.row]
            
        println("Reached collection view")
        let userImageFile = clothing["image"] as PFFile
        let image = UIImage(data:userImageFile.getData()) as UIImage!
        let description = clothing["description"] as String!
        cell.setCell(description, clothingImageIn:image)
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
}

