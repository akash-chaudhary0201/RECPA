//
//  RegHomeVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit

class RegHomeVC: UIViewController {

    @IBOutlet weak var secondStepView: UIView!
    @IBOutlet weak var thirdStepView: UIView!
    @IBOutlet weak var stepView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func goToBasicInfo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "BasicInfoVC") as? BasicInfoVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
}
