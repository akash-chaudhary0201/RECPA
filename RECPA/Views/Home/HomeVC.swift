//
//  HomeVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 18/06/25.
//

import UIKit
import SideMenu

class HomeVC: UIViewController {

    private var sidemenu: SideMenuNavigationController?
    @IBOutlet weak var availableSchmeCollection: UICollectionView!
    @IBOutlet weak var newLaunchesCollection: UICollectionView!
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSideMenu()
    }
    
    //SideMenu Functio:-
    func setUpSideMenu(){
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(withIdentifier: "SideMenuEx") as? SideMenuEx {
            
            sidemenu = SideMenuNavigationController(rootViewController: menuVC)
            sidemenu?.leftSide = true
            sidemenu?.setNavigationBarHidden(true, animated: false)
            sidemenu?.presentationStyle = .menuSlideIn
            sidemenu?.presentationStyle.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            sidemenu?.menuWidth = min(view.frame.width, view.frame.height) * 0.90
            
            SideMenuManager.default.leftMenuNavigationController = sidemenu
            SideMenuManager.default.addPanGestureToPresent(toView: view)
        }
    }
    
    //Function to open side menu:
    @IBAction func openSideMenuAction(_ sender: Any) {
        if let sideMenu = sidemenu {
            present(sideMenu, animated: true) {
                self.view.alpha = 0.45
            }
        }
    }
    
    @IBAction func goToAllProjects(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Projects", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "ProjectsVC") as? ProjectsVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
}

extension HomeVC:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newLaunchesCollection{
            return 10
        }else if collectionView == availableSchmeCollection{
            return 10
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newLaunchesCollection{
            let cell = newLaunchesCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NewLaunchCollectionCell
            
            return cell
        }else if collectionView == availableSchmeCollection{
            let cell = availableSchmeCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AvailableSchemeCollectionCell
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == newLaunchesCollection{
            let storyboard = UIStoryboard(name: "Projects", bundle: nil)
            if let nextController = storyboard.instantiateViewController(withIdentifier: "ProjDetViewController") as? ProjDetViewController{
                self.navigationController?.pushViewController(nextController, animated: true)
            }
        }
    }
    
}


class NewLaunchCollectionCell:UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
}

class AvailableSchemeCollectionCell:UICollectionViewCell{
    
}
