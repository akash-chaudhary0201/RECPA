//
//  TabBarVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 27/06/25.
//

import UIKit
import SideMenu
import SwiftyGif

class TabBarVC: UIViewController, SideMenuDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var menuImage: UIImageView!
    
    private var sideMenu: SideMenuNavigationController?
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var leftMostView: UIView!
    @IBOutlet weak var rightMostView: UIView!
    
    //Home button:
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImage: UIImageView!
    
    //Leads button:
    @IBOutlet weak var leadsLabel: UILabel!
    @IBOutlet weak var leadsImage: UIImageView!
    
    //Project button:
    @IBOutlet weak var projectsLabel: UILabel!
    @IBOutlet weak var projectCircularView: UIView!
    
    //Bookings button:
    @IBOutlet weak var bookingsLabel: UILabel!
    @IBOutlet weak var bookingImage: UIImageView!
    
    //Profile button:
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    private var tabLabels: [UILabel] = []
    
    func didSelectMenuItem(at index: Int) {
        switchToTab(index: index)
    }
    
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var menuBar: UIView!
    @IBOutlet weak var containerView: UIView!
    
    private var currentChildVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarView.clipsToBounds = false
        
        leftMostView.layer.cornerRadius = 20
        leftMostView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        leftMostView.clipsToBounds = true
        
        rightMostView.layer.cornerRadius = 20
        rightMostView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        rightMostView.clipsToBounds = true
        
        tabLabels = [homeLabel, leadsLabel, projectsLabel, bookingsLabel, profileLabel]
        
        switchToTab(index: 0)
        setUpSideMenu()
        
        do {
            let gif = try UIImage(gifName: "menu.gif")
            menuImage.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: \(error)")
        }
        
    }
    
    func setUpSideMenu(){
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        if let menuVC = storyboard.instantiateViewController(withIdentifier: "SideMenuEx") as? SideMenuEx {
            
            menuVC.delegate = self
            
            sideMenu = SideMenuNavigationController(rootViewController: menuVC)
            sideMenu?.leftSide = true
            sideMenu?.setNavigationBarHidden(true, animated: false)
            sideMenu?.presentationStyle = .menuSlideIn
            sideMenu?.presentationStyle.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            sideMenu?.menuWidth = min(view.frame.width, view.frame.height) * 0.90
            
            SideMenuManager.default.leftMenuNavigationController = sideMenu
            SideMenuManager.default.addPanGestureToPresent(toView: view)
        }
    }
    
    @IBAction func tabButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        print("Select buttons: tag: \(tag)")
        switchToTab(index: tag)
    }
    
    private func switchToTab(index: Int) {
        
        for (i, label) in tabLabels.enumerated() {
            label.textColor = (i == index) ? UIColor(red: 171/255, green: 105/255, blue: 57/255, alpha: 255/255) : UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
        }
        
        if let currentVC = currentChildVC {
            currentVC.willMove(toParent: nil)
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }
        
        var storyboardName = ""
        var viewControllerID = ""
        
        switch index {
        case 0:
            storyboardName = "Home"
            viewControllerID = "HomeVC"
            projectCircularView.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
            homeImage.image = UIImage(named: "activeHome")
            profileImage.image = UIImage(named: "profile")
        case 1:
            storyboardName = "Leads"
            viewControllerID = "LeadsVC"
            projectCircularView.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
            homeImage.image = UIImage(named: "home")
            profileImage.image = UIImage(named: "profile")
        case 2:
            storyboardName = "Projects"
            viewControllerID = "ProjectsVC"
            projectCircularView.backgroundColor = UIColor(red: 171/255, green: 105/255, blue: 57/255, alpha: 255/255)
            homeImage.image = UIImage(named: "home")
            profileImage.image = UIImage(named: "profile")
        case 3:
            storyboardName = "Bookings"
            viewControllerID = "BookingsVC"
            projectCircularView.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
            homeImage.image = UIImage(named: "home")
            profileImage.image = UIImage(named: "profile")
        case 4:
            storyboardName = "Profile"
            viewControllerID = "ProfileVC"
            projectCircularView.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
            profileImage.image = UIImage(named: "activeProfile")
            homeImage.image = UIImage(named: "home")
        default:
            return
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let newVC = storyboard.instantiateViewController(withIdentifier: viewControllerID)
        
        addChild(newVC)
        newVC.view.frame = containerView.bounds
        containerView.addSubview(newVC.view)
        newVC.didMove(toParent: self)
        
        currentChildVC = newVC
    }
    
    @IBAction func openSideMenuAction(_ sender: Any) {
        if let sideMenu = sideMenu {
            present(sideMenu, animated: true, completion: nil)
        }
    }
}
