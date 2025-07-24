//
//  DropDownFunctions.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import Foundation
import UIKit
import DropDown

class DropDownFunctions{
    
    static func setupDropDown(dropDown: DropDown, anchor: UIView, dataSource: [String], labelToUpdate: UILabel) {
        dropDown.anchorView = anchor
        dropDown.dataSource = dataSource
        dropDown.direction = .any
        
        dropDown.selectionAction = { (index: Int, item: String) in
            labelToUpdate.text = item
            labelToUpdate.textColor = .black
        }
        
        dropDown.backgroundColor = .white
        dropDown.setupCornerRadius(10)
        dropDown.textColor = .black
//        dropDown.cornerRadius = 10
    }
    
}
