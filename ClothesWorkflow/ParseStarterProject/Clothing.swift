//
//  Clothing.swift
//  Clothes Match Single View
//
//  Created by Marie Hoeger on 10/20/14.
//  Copyright (c) 2014 Marie Hoeger. All rights reserved.
//

import Foundation

class Clothing
{
    var mainColor = "Color"
    var myImage = "None"
    var itemType = "Top or Bottom"
    var description = ""
    
    init(itemType: String, mainColor: String, myImage: String, description: String){
        if (description == ""){
            self.description = mainColor + " " + itemType
        }
        else{
            self.description = description
        }
        self.mainColor = mainColor
        self.myImage = myImage
        self.itemType = itemType
    }
}
