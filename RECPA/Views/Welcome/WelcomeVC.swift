//
//  WelcomeVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet  var buttons: [UIButton]!
    
    let gradientLayer = CAGradientLayer()
    
    var urlString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("-----------------------------------------------------------------------")
        
         urlString = APIManager.APPUrl.getProperties
        print(urlString!)
        
        mainImage.layer.cornerRadius = 10
        
        for button in buttons {
            button.layer.cornerRadius = 5
        }
        
        view.alpha = 0.95
        print("Akash")
        
        gradientLayer.colors = [
            UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 0.90).cgColor,
            UIColor(red: 27/255, green: 58/255, blue: 40/255, alpha: 1).cgColor
        ]
        
        
        mainView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = mainView.bounds
    }
    
    //Domestic Action:
    @IBAction func domesticButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            UserDefaults.standard.set("domestic", forKey: "userType")
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    //International Action:
    @IBAction func internationalButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            UserDefaults.standard.set("international", forKey: "userType")
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    //Agent Action:
    @IBAction func agentAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            UserDefaults.standard.set("agent", forKey: "userType")
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    
    
}
