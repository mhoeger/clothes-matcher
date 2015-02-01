//
//  ViewController.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 10/20/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//
import UIKit
import Foundation

class UserViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //var touchTrue = true
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!

    
    //Replace this with database of clothes matching
    //Hashable? if dictionary, "Clothing" type must be.
    var clothesArray: [Clothing] = [Clothing]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //--self.view.backgroundColor = UIColor.blackColor()
        self.setUpClothing()
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
        
        //--let testImage = UIImage(named: "BlackPants.jpg")
        //--self.leftImage.image = UIImage(named: "BlackPants.jpg")
    }

 /*   func loadButtons(button: UIButton){
        let buttonImage = UIImage(named: "PurpleShirt.png") as UIImage?
        let button   = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRectMake(40, 40, 100, 100)
        button.setImage(buttonImage, forState: UIControlState.Normal)
        //button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "btnTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
*/
/*
    @IBAction func btnTouched(sender : AnyObject?){
        rightImage.image = UIImage(named: "BlackPants.jpg")
        
        //rightImage.image = sender.imageForState(.Normal)

        /*if (touchTrue){
            rightImage.image = sender.imageForState(.Normal)
                //UIImage(named: "PurpleShirt.png")
            touchTrue = false
        }
        else{
            rightImage.image = UIImage(named: "BlackPants.jpg")
            touchTrue = true
        }*/
    }
*/
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
    
    
    //Action after selecting item
    func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath){
            //let indexPath = collectionView.indexPathsForSelectedItems()
            //if (indexPath.count == 0){
              //  println("EMPTY.")
            //}
            let currentCell:ClothingCell = collectionView.cellForItemAtIndexPath(indexPath) as ClothingCell
                //[0] as NSIndexPath) as CustomCell

            //let indexPath = collectionView.indexPathsForSelectedItems()
            //let currentCell:CustomCell = collectionView.cellForItemAtIndexPath(indexPath) as CustomCell
            rightImage.image = UIImage(named:"BlackPants.jpg")
            leftImage.image = currentCell.clothingImage!.image
            println(currentCell.clothingText!.text)
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
        else{
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        let clothing = clothesArray[indexPath.row]
        //cell.myButton.addTarget(self, action: "btnTouched:", forControlEvents: UIControlEvents.TouchUpInside)
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
    
    //WEBSITE TUTORIAL
 /*
    //1
    var  selectedClothingIndexPath: NSIndexPath?
    
        {
        didSet {
            //2
            var indexPaths = [NSIndexPath]()
            if selectedClothingIndexPath != nil {
                indexPaths.append(selectedClothingIndexPath!)
            }
            if oldValue != nil {
                indexPaths.append(oldValue!)
            }
            //3
            
            self.collectionView.performBatchUpdates({
                self.collectionView.reloadItemsAtIndexPaths(indexPaths)
                return
                },completion: nil){
                    completed in
                    //4
                    if selectedClothingIndexPath != nil {
                        self.collectionView?.scrollToItemAtIndexPath(
                            self.largePhotoIndexPath!,
                            atScrollPosition: .CenteredVertically,
                            animated: true)
                    }
            }

        }
    }

    
    func collectionView(collectionView: UICollectionView,
        shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
            
            if selectedClothingIndexPath == indexPath {
                selectedClothingIndexPath = nil
            }
            else {
                selectedClothingIndexPath = indexPath
            }
            return false
    }
    
   */
    
}

