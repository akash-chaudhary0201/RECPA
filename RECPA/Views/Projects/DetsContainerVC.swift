//
//  DetsContainerVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 24/06/25.
//

import UIKit
import SDWebImage
import SwiftLoader

class DetsContainerVC: UIViewController {
    
    @IBOutlet weak var propInfoView: UIView!
    @IBOutlet weak var infoMainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainImageHeight: NSLayoutConstraint!
    
    
    //Labels outlets:
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyLocation: UILabel!
    @IBOutlet weak var propertyBudget: UILabel!
    @IBOutlet weak var propertyReraNo: UILabel!
    @IBOutlet weak var propertyDescription: UILabel!
    
    var projectId:String?
    
    var singleProperty:PropertyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBorders()
        
        let screenHeight = UIScreen.main.bounds.height
        let dynamicHeight = screenHeight * 0.3
        mainImageHeight.constant = dynamicHeight
        view.layoutIfNeeded()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func addBorders(){
        mainImageView.clipsToBounds = true
        mainImageView.cornerRadius = 40
        mainImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        propInfoView.layer.shadowColor = UIColor.black.cgColor
        propInfoView.layer.shadowOpacity = 0.3
        propInfoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        propInfoView.layer.shadowRadius = 4
        propInfoView.layer.masksToBounds = false
        
        infoMainView.clipsToBounds = true
        infoMainView.layer.cornerRadius = 40
        infoMainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

