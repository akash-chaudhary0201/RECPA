//
//  SideMenuEx.swift
//  RECPA
//
//  Created by Akash Chaudhary  on 24/07/25.
//

import UIKit
import SwiftyGif

protocol SideMenuDelegate: AnyObject {
    func didSelectMenuItem(at index: Int)
}

class SideMenuEx: UIViewController {
    
    
    @IBOutlet weak var closeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectsDropDownView.isHidden = true
        projectsDropDownViewHeight.constant = 0
        
        leadsDropDownView.isHidden = true
        leadsDropDownViewHeight.constant = 0
        
        do {
            let gif = try UIImage(gifName: "Close.gif")
            closeImage.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: \(error)")
        }
    }
    
    weak var delegate: SideMenuDelegate?
    
    //Project View:
    @IBOutlet weak var projectsDropDownView: UIView!
    @IBOutlet weak var projectsDropDownViewHeight: NSLayoutConstraint!
    var isProjectDropDownOpen:Bool = false
    
    //Leads View:
    @IBOutlet weak var leadsDropDownView: UIView!
    @IBOutlet weak var leadsDropDownViewHeight: NSLayoutConstraint!
    var isLeadDropDownOpen:Bool = false
    
    //All View:
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var projectsView: UIView!
    @IBOutlet weak var leadsView: UIView!
    @IBOutlet weak var bookingsView: UIView!
    //    @IBOutlet weak var brokerageView: UIView!
    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var engagementView: UIView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var privacyView: UIView!
    @IBOutlet weak var termsView: UIView!
    
    @IBAction func openProjectDropDown(_ sender: Any) {
        projectsView.backgroundColor = .white
        leadsView.backgroundColor = .clear
        homeView.backgroundColor = .clear
        bookingsView.backgroundColor = .clear
        
        offerView.backgroundColor = .clear
        engagementView.backgroundColor = .clear
        settingsView.backgroundColor = .clear
        if isProjectDropDownOpen{
            projectsDropDownView.isHidden = true
            projectsDropDownViewHeight.constant = 0
            isProjectDropDownOpen = false
        }else{
            projectsDropDownView.isHidden = false
            projectsDropDownViewHeight.constant = 150
            isProjectDropDownOpen = true
        }
    }
    
    @IBAction func openLeadsDropDown(_ sender: Any) {
        projectsView.backgroundColor = .clear
        leadsView.backgroundColor = .white
        homeView.backgroundColor = .clear
        bookingsView.backgroundColor = .clear
        
        offerView.backgroundColor = .clear
        engagementView.backgroundColor = .clear
        settingsView.backgroundColor = .clear
        if isLeadDropDownOpen{
            leadsDropDownView.isHidden = true
            leadsDropDownViewHeight.constant = 0
            isLeadDropDownOpen = false
        }else{
            leadsDropDownView.isHidden = false
            leadsDropDownViewHeight.constant = 100
            isLeadDropDownOpen = true
        }
    }
    
    //--------------Functions to highlight view:----------------------
    // Resets all background colors to clear
    func resetAllViewBackgrounds() {
        homeView.backgroundColor = .clear
        projectsView.backgroundColor = .clear
        leadsView.backgroundColor = .clear
        bookingsView.backgroundColor = .clear
        //        brokerageView.backgroundColor = .clear
        offerView.backgroundColor = .clear
        engagementView.backgroundColor = .clear
        settingsView.backgroundColor = .clear
        helpView.backgroundColor = .clear
        privacyView.backgroundColor = .clear
        termsView.backgroundColor = .clear
    }
    
    // Collapses all dropdown views
    func collapseAllDropDowns() {
        projectsDropDownView.isHidden = true
        projectsDropDownViewHeight.constant = 0
        isProjectDropDownOpen = false
        
        leadsDropDownView.isHidden = true
        leadsDropDownViewHeight.constant = 0
        isLeadDropDownOpen = false
    }
    
    // Highlights a specific view by setting its background color to white
    func highlightView(forTag tag: Int) {
        resetAllViewBackgrounds()
        
        if let viewToHighlight = view.viewWithTag(tag) {
            viewToHighlight.backgroundColor = .white
        }
    }
    //-----------------------------------------------------------------
    
    //Action for menu buttons:
    @IBAction func menuButtonTapped(_ sender:UIButton){
        resetAllViewBackgrounds()
        collapseAllDropDowns()
        
        switch sender.tag {
        case 0:
            highlightView(forTag: 99)
            delegate?.didSelectMenuItem(at: 0)
            self.dismiss(animated: true, completion: nil)
        case 1:
            highlightView(forTag: 5)
            delegate?.didSelectMenuItem(at: 3)
            self.dismiss(animated: true, completion: nil)
        case 2:
            print("ak")
            highlightView(forTag: 6)
        case 3:
            highlightView(forTag: 7)
            print("ak")
        case 4:
            highlightView(forTag: 8)
            print("ak")
        case 5:
            highlightView(forTag: 9)
            print("ak")
        case 6:
            highlightView(forTag: 10)
            print("ak")
        case 7:
            highlightView(forTag: 11)
            print("ak")
            
        default:
            break
        }
    }
}
