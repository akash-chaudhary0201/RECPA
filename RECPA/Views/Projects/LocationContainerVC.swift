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
    
    var projectId:String?
    
    //Outlets:
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBorders()
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
