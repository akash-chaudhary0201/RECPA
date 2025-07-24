//
//  TabBarVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 27/06/25.
//

import UIKit
import SideMenu

class TabBarVC: UIViewController, SideMenuDelegate, UINavigationControllerDelegate {

    private var sideMenu: SideMenuNavigationController?
    
    func didSelectMenuItem(at index: Int) {
        switchToTab(index: index)
    }
    
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var menuBar: UIView!
    @IBOutlet weak var containerView: UIView!
    
    private var currentChildVC: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switchToTab(index: 0)
        setUpSideMenu()
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
        case 1:
            storyboardName = "Leads"
            viewControllerID = "LeadsVC"
        case 2:
            storyboardName = "Projects"
            viewControllerID = "ProjectsVC"
        case 3:
            storyboardName = "Bookings"
            viewControllerID = "BookingsVC"
        case 4:
            storyboardName = "Profile"
            viewControllerID = "ProfileVC"
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
