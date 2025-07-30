//
//  LocationContainerVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 25/06/25.
//

import UIKit
import SDWebImage

class LocationContainerVC: UIViewController {
    
    @IBOutlet weak var propInfoView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainImageHeight: NSLayoutConstraint!
    
    var projectId:String?
    
    //Outlets:
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBorders()
        
        let screenHeight = UIScreen.main.bounds.height
        let dynamicHeight = screenHeight * 0.3
        
        mainImageHeight.constant = dynamicHeight
        view.layoutIfNeeded()
    }
    
    //Function to add borders:
    func addBorders(){
        mainImageView.clipsToBounds = true
        mainImageView.cornerRadius = 40
        mainImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        propInfoView.layer.shadowColor = UIColor.black.cgColor
        propInfoView.layer.shadowOpacity = 0.3
        propInfoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        propInfoView.layer.shadowRadius = 4
        propInfoView.layer.masksToBounds = false
        
    }
    
}
