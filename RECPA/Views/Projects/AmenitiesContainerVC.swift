//
//  AmenitiesContainerVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 25/06/25.
//

import UIKit
import SDWebImage

class AmenitiesContainerVC: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var propInfoView: UIView!
    @IBOutlet weak var amenitiesMainView: UIView!
    @IBOutlet weak var amenitiesCollection: UICollectionView!
    
    var projectId:String?
    
    //Outlets:
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyLocation: UILabel!
    
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
        
        amenitiesMainView.clipsToBounds = true
        amenitiesMainView.layer.cornerRadius = 40
        amenitiesMainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension AmenitiesContainerVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = amenitiesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

class AmenitiesCollectionCell:UICollectionViewCell{
    
}
