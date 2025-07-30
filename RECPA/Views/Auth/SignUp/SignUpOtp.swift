//
//  RegisterOtpVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit
import AEOTPTextField

class SignUpOtp: UIViewController, AEOTPTextFieldDelegate {
    
    @IBOutlet weak var verifyOtpButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var otpTextField: AEOTPTextField!
    @IBOutlet weak var otpDetailLabel: UILabel!
    
    var userType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType")
        
        setBorderSpecs()
        setUpUi()
        configureOTPField()
    }
    
    
    //Function to setup UI:
    func setUpUi(){
        if userType == "international"{
            otpDetailLabel.text = "Enter the verification code we just sent to your Email Id (vishal@gmail.com)"
        }
    }
    
    // Function to configure otp field
    func configureOTPField() {
        otpTextField.otpDelegate = self
        otpTextField.configure(with: 6)
    }
    
    // Function to set border radius and border colors
    func setBorderSpecs() {
        backbutton.layer.cornerRadius = 5
        mainView.layer.cornerRadius = 20
        verifyOtpButton.layer.cornerRadius = 10
    }
    
    // OTP Library function
    func didUserFinishEnter(the code: String) {
        print("OTP Entered: \(code)")
        // Dismiss the keyboard when OTP entry is complete
        otpTextField.resignFirstResponder()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func verifyOtpAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "RegHomeVC") as? RegHomeVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    
}
