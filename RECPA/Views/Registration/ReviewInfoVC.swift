//
//  ReviewInfoVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/06/25.
//

import UIKit
//import SwiftyGif

class ReviewInfoVC: UIViewController {
    
    //Basic Details View Outlets:
    @IBOutlet weak var basicEditview: UIView!
    @IBOutlet weak var basicDetailsViewHeight: NSLayoutConstraint!
    @IBOutlet weak var basicDetailsView: UIView!
    var isBasicDetailsViewOpen:Bool = false
    
    @IBOutlet weak var backButton: UIButton!
    
    //Address View Outlets:
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressViewHeight: NSLayoutConstraint!
    @IBOutlet weak var addressEditView: UIView!
    var isAddressViewOpen:Bool = false
    
    //Legal view Outlets:
    @IBOutlet weak var legalView: UIView!
    
    @IBOutlet weak var legalViewEdit: UIView!
    @IBOutlet weak var legalViewHeight: NSLayoutConstraint!
    var isLegalViewOpen:Bool = false
    @IBOutlet weak var panView: UIView!
    @IBOutlet weak var gstView: UIView!
    @IBOutlet weak var gstViewHieght: NSLayoutConstraint!
    @IBOutlet weak var reraview: UIView!
    @IBOutlet weak var reraViewHeight: NSLayoutConstraint!
    @IBOutlet weak var otherView: UIView!
    @IBOutlet weak var otherViewHeight: NSLayoutConstraint!
    
    //All Info view:
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var companyType: UILabel!
    @IBOutlet weak var cpType: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyOwnerName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var locality: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var postalCode: UILabel!
    @IBOutlet weak var panNumber: UILabel!
    @IBOutlet weak var aadharNumber: UILabel!
    @IBOutlet weak var gstNumber: UILabel!
    @IBOutlet weak var reraNumber: UILabel!
    @IBOutlet weak var rereRegistrationDate: UILabel!
    @IBOutlet weak var reraRenewalDate: UILabel!
    
    //Outlet for stepper:
    @IBOutlet  var stepperView: [UIView]!
    
    //File paths from userdefaults;
    var aadharPath:String?
    var panPath:String?
    var reraPath:String?
    var chequePath:String?
    var selfiePath:String?
    
    var userType:String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType") ?? "ak"
        
        //Basic
        basicDetailsViewHeight.constant = 0
        basicDetailsView.isHidden = true
        basicEditview.isHidden = true
        
        //Address
        addressViewHeight.constant = 0
        addressView.isHidden = true
        addressEditView.isHidden = true
        
        //Legal:
        legalViewHeight.constant = 0
        legalView.isHidden = true
        legalViewEdit.isHidden = true
        
        if userType == "agent"{
            otherView.isHidden = true
            otherViewHeight.constant = 0
            reraview.isHidden = true
            reraViewHeight.constant = 0
            gstView.isHidden = true
            gstViewHieght.constant = 0
        }else{
            otherView.isHidden = false
            otherViewHeight.constant = 100
            reraview.isHidden = false
            reraViewHeight.constant = 153
            gstView.isHidden = false
            gstViewHieght.constant = 105
        }

    }

    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Function to open basic details view
    @IBAction func openBasicDetailsView(_ sender: Any) {
        if isBasicDetailsViewOpen{
            basicDetailsViewHeight.constant = 0
            isBasicDetailsViewOpen = false
            basicDetailsView.isHidden = true
            basicEditview.isHidden = true
        }else{
            basicDetailsViewHeight.constant = 150
            isBasicDetailsViewOpen = true
            basicDetailsView.isHidden = false
            basicEditview.isHidden = false
        }
    }
    
    //Function to open address view:
    @IBAction func openAddressView(_ sender: Any) {
        if isAddressViewOpen{
            addressViewHeight.constant = 0
            isAddressViewOpen = false
            addressView.isHidden = true
            addressEditView.isHidden = true
        }else{
            addressViewHeight.constant = 180
            isAddressViewOpen = true
            addressView.isHidden = false
            addressEditView.isHidden = false
        }
    }
    
    //Function to open legal view:
    @IBAction func openLegalView(_ sender: Any) {
        if isLegalViewOpen{
            legalViewHeight.constant = 0
            isLegalViewOpen = false
            legalView.isHidden = true
            legalViewEdit.isHidden = true
        }else{
            if userType == "agent"{
                legalViewHeight.constant = 140
            }else{
                legalViewHeight.constant = 540
            }
            isLegalViewOpen = true
            legalView.isHidden = false
            legalViewEdit.isHidden = false
        }
    }
    
    //Function to go to edit basic details:
    @IBAction func goToEditBasicDetails(_ sender: Any) {
        //Logic to jump back two vcs and once
        if let viewControllers = navigationController?.viewControllers {
            for vc in viewControllers {
                if let basicVC = vc as? BasicInfoVC {
                    navigationController?.popToViewController(basicVC, animated: true)
                    break
                }
            }
        }
    }
    
    //Function to go to edit address details:
    @IBAction func goToEditAddress(_ sender: Any) {
        //Logic to jump back two vcs and once
        if let viewControllers = navigationController?.viewControllers {
            for vc in viewControllers{
                if vc is BasicInfoVC{
                    navigationController?.popToViewController(vc, animated: true)
                    break
                }
            }
        }
    }
    
    //Function to go to edit legal details:
    @IBAction func goToEditLegal(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func goToHome(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC {
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    //Function to navigate to uploaded files page:
    @IBAction func seeUploadedFiles(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "UploadedFilesVC") as? UploadedFilesVC {
            let navController = UINavigationController(rootViewController: nextController)
            switch sender.tag{
            case 0:
                nextController.fileType = "pan"
            case 1:
                nextController.fileType = "aadhar"
            case 2:
                nextController.fileType = "rera"
            case 3:
                nextController.fileType = "cheque"
            case 4:
                nextController.fileType = "selfie"
            default:
                break
            }
            navController.modalPresentationStyle = .overFullScreen
            nextController.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3966007864)
            self.present(navController, animated: false, completion: nil)
        }
    }
}
