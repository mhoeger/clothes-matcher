//
//  ClothingCell.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 11/15/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//

import UIKit

class ClothingCell: UICollectionViewCell {
    
    @IBOutlet weak var clothingText: UILabel!
    
    @IBOutlet weak var clothingImage: UIImageView!
    
    func setCell(clothingDescriptionText: String, clothingImageFilename: String!){
        
        clothingImage.image = UIImage(named: (clothingImageFilename))
        sendSubviewToBack(clothingImage)
        clothingText.text = clothingDescriptionText
    }
}
