//
//  ProjDetExViewController.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 20/06/25.x


import UIKit
import SDWebImage
import SwiftLoader

class ProjDetViewController: UIViewController {
    
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var mediaButton: UIButton!
    @IBOutlet weak var amenitiesButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var amenitiesView: UIView!
    @IBOutlet weak var locationView: UIView!
    
    var projectId:String?
    
    var singleProperty:PropertyModel?
    
    var didHighlightInitialButton = false
    
    override func viewDidLoad() {
        
        mediaView.isHidden = true
        amenitiesView.isHidden = true
        locationView.isHidden = true
        detailsView.isHidden = false
        
        for child in children {
            if let detsVC = child as? DetsContainerVC {
                detsVC.projectId = self.projectId
            }
            if let mediaVC = child as? MediaContainerVC{
                mediaVC.projectId = self.projectId
            }
            if let amVc = child as? AmenitiesContainerVC{
                amVc.projectId = self.projectId
            }
            if let locationVC = child as? LocationContainerVC{
                locationVC.projectId = self.projectId
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !didHighlightInitialButton {
            DispatchQueue.main.async {
                self.highlightSelectedButton(self.detailsButton)
                self.didHighlightInitialButton = true
            }
        }
    }
    
    func highlightSelectedButton(_ selectedButton: UIButton) {
        let buttons = [detailsButton, mediaButton, amenitiesButton, locationButton]
        
        for button in buttons {
            button?.layer.sublayers?.removeAll(where: { $0.name == "bottomBorder" })
            button?.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        }
        
        selectedButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        addBottomBorder(to: selectedButton)
    }
    
    //Function to go back
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //Function to add bottor border:
    func addBottomBorder(to button: UIButton, color: UIColor = UIColor(red: 171/255, green: 105/255, blue: 57/255, alpha: 255/255), height: CGFloat = 2.0) {
        button.layer.sublayers?.removeAll(where: { $0.name == "bottomBorder" })
        
        let border = CALayer()
        border.name = "bottomBorder"
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: button.frame.height - height, width: button.frame.width, height: height)
        button.layer.addSublayer(border)
    }
    
    @IBAction func topButtonTapped(_ sender: UIButton) {
        
        highlightSelectedButton(sender)
        showView(forTag: sender.tag)
    }
    
    func showView(forTag tag: Int) {
        detailsView.isHidden = tag != 0
        mediaView.isHidden = tag != 1
        amenitiesView.isHidden = tag != 2
        locationView.isHidden = tag != 3
    }
    
}
