//
//  LoginOtpVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 01/07/25.
//

import UIKit
import AEOTPTextField

class LoginOtpVC: UIViewController, AEOTPTextFieldDelegate {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var otpTextField: AEOTPTextField!
    
    var userType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType")
        print("User type: \(userType!)")
    
        addBorder()
        
        configureOTPField()
        
        addDoneButtonOnKeyboard()
        
    }
    
    func configureOTPField() {
        otpTextField.otpDelegate = self
        otpTextField.configure(with: 6)
    }
    
    //Function to add border:
    func addBorder(){
        mainView.clipsToBounds = true
        mainView.layer.cornerRadius = 40
        mainView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // Called every time user types a digit
    func didChangeValidity(isValid: Bool) {
        print("Is OTP Valid: \(isValid)")
    }
    
    // Called after user finishes entering OTP
    func didUserFinishEnter(the code: String) {
        print("OTP Entered: \(code)")
    }
    
    @IBAction func backActin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func addDoneButtonOnKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.items = [flexibleSpace, doneButton]
        
        otpTextField.inputAccessoryView = toolbar
    }

    @objc func doneButtonAction() {
        otpTextField.resignFirstResponder()
    }

    
}
