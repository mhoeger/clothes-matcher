//
//  CustomCell.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 10/23/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {

    @IBOutlet weak var clothingText: UILabel!
    @IBOutlet var clothingImage: UIImageView!
    
    
    func setCell(clothingDescriptionText: String, clothingImageFilename: String!){
        
        clothingImage.image = UIImage(named: (clothingImageFilename))
        clothingText.text = clothingDescriptionText
    }
    
}
