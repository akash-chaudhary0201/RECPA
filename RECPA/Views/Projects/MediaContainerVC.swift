//
//  MediaContainerVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 24/06/25.
//

import UIKit
import SDWebImage

class MediaContainerVC: UIViewController {
    
    @IBOutlet weak var projectMainView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var propInfoView: UIView!
    @IBOutlet weak var projectImagesCollection: UICollectionView!
    
    var projectId:String?
    
    //Outlets:
    @IBOutlet weak var propertyName: UILabel!
    @IBOutlet weak var propertyLocation: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        addBorders()
    }

    
    //Func to add border:
    func addBorders(){
        mainImageView.clipsToBounds = true
        mainImageView.cornerRadius = 40
        mainImageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        propInfoView.layer.shadowColor = UIColor.black.cgColor
        propInfoView.layer.shadowOpacity = 0.3
        propInfoView.layer.shadowOffset = CGSize(width: 0, height: 0)
        propInfoView.layer.shadowRadius = 4
        propInfoView.layer.masksToBounds = false
        
        projectMainView.clipsToBounds = true
        projectMainView.layer.cornerRadius = 40
        projectMainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension MediaContainerVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = projectImagesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
}

class ProjectImageCell:UICollectionViewCell{
    
}
