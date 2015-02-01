//
//  ViewController.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 10/20/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//
import UIKit
import Foundation


class CustomViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet weak var leftImage: UIImageView!
    
    //Replace this with database of clothes matching
    //Hashable? if dictionary, "Clothing" type must be.
    var clothesArray: [Clothing] = [Clothing]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blackColor()
        self.setUpClothing()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        
        //--let testImage = UIImage(named: "BlackPants.jpg")
        //--self.leftImage.image = UIImage(named: "BlackPants.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUpClothing() {
        var testClothing1 = Clothing(itemType: "Shirt", mainColor: "Purple", myImage: "PurpleShirt.png", description: "purple shirt")
        var testClothing2 = Clothing(itemType: "Pants", mainColor: "Black", myImage: "BlackPants.jpg", description: "black pants")
        
        clothesArray.append(testClothing1)
        clothesArray.append(testClothing2)
        
    }
    
    //The number of items displayed in the collection
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return clothesArray.count
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.Landscape.rawValue)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:ClothingCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as ClothingCell
        
        if indexPath.row % 2 == 0{
            cell.backgroundColor = UIColor.blueColor()
        }
        else{
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        let clothing = clothesArray[indexPath.row]
        
        cell.setCell(clothing.description, clothingImageFilename: clothing.myImage)
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

