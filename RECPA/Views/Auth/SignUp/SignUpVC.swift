//
//  RegisterVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var getOtpButton: UIButton!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var registerTextField: UITextField!
    @IBOutlet weak var textFieldIcon: UIImageView!
    @IBOutlet weak var phoneOremailLabel: UILabel!
    
    
    //User type which I will be using to maintain different type of login and signup:
    var userType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType")
        print("User type: \(userType!)")
        addBorderSpecs()
        
        setUpUI()
    }
    
    func setUpUI(){
        if userType == "international"{
            registerTextField.placeholder = "Enter Your Email"
            textFieldIcon.image = UIImage(systemName: "envelope")
            phoneOremailLabel.text = "Email"
        }
    }
    
    //Function to add border radius and border colors:
    func addBorderSpecs(){
        mainView.layer.cornerRadius = 20
        backButton.layer.cornerRadius = 5
        mobileView.layer.cornerRadius = 10
        mobileView.layer.borderWidth = 1
        mobileView.layer.borderColor = UIColor.lightGray.cgColor
        getOtpButton.layer.cornerRadius = 10
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Function to go to verify otp page:
    @IBAction func goToOtp(_ sender: Any) {
        let storboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let nextController = storboard.instantiateViewController(withIdentifier: "SignUpOtp") as? SignUpOtp{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    //Function to go to login page:
    @IBAction func goToLoginPage(_ sender: Any) {
        let storboard = UIStoryboard(name: "Login", bundle: nil)
        if let nextController = storboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
}
