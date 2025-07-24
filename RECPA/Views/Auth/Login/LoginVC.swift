//
//  LoginVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    var userType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType")
        print("User type: \(userType!)")
        
        addBorder()
    }
    
    //Function to add border:
    func addBorder(){
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 40
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Function to go to registration page:
    @IBAction func goToRegistration(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Funcion to go ti verify loginOtp:
    @IBAction func goToVerifyLoginOtp(_ sender: Any) {
        let storboard = UIStoryboard(name: "Login", bundle: nil)
        if let nextController = storboard.instantiateViewController(withIdentifier: "LoginOtpVC") as? LoginOtpVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }

}
