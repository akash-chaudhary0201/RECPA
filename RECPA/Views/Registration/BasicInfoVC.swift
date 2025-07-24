//
//  BasicInfoVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 16/06/25.
//

import UIKit
import DropDown

class BasicInfoVC: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var stateView: UIView!
    @IBOutlet weak var countyLabel: UILabel!
    @IBOutlet weak var countryButton: UIButton!
    @IBOutlet weak var countriView: UIView!
    @IBOutlet weak var companyTypeView: UIView!
    @IBOutlet weak var companyTypeLable: UILabel!
    
    //All Text Fields Outlets:
    @IBOutlet weak var companyName: UITextField!
    @IBOutlet weak var ownerName: UITextField!
    @IBOutlet weak var companyEmail: UITextField!
    @IBOutlet weak var contactPersonName: UITextField!
    @IBOutlet weak var contactPersonEmail: UITextField!
    @IBOutlet weak var contactPersonMobile: UITextField!
    @IBOutlet weak var addressLine: UITextField!
    @IBOutlet weak var locality: UITextField!
    @IBOutlet weak var postalCode: UITextField!
    
    //Stepper outlets:
    @IBOutlet var stepperView: [UIView]!
    
    var companyTypeArray:[String] = ["First", "Second", "Third", "Fourth"]
    let indianCities = [
        "Mumbai",
        "Delhi",
    ]
    let countries = [
        "India",
        "United States",
        "Canada"
    ]
    let indianStates = [
        "Andhra Pradesh",
        "Arunachal Pradesh",
        "Assam",
    ]

    var companyTypeDropDown = DropDown()
    var countriesDropDown = DropDown()
    var stateDropDown = DropDown()
    var citiesDropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryButton.isEnabled = true
        
        //Setting up DropDown:-
        //Company type dropdown:
        DropDownFunctions.setupDropDown(dropDown: companyTypeDropDown, anchor: companyTypeView, dataSource: companyTypeArray, labelToUpdate: companyTypeLable)
        
        //Country dropdown
        DropDownFunctions.setupDropDown(dropDown: countriesDropDown, anchor: countriView, dataSource: countries, labelToUpdate: countyLabel)
        
        //State DropDown:
        DropDownFunctions.setupDropDown(dropDown: stateDropDown, anchor: stateView, dataSource: indianStates, labelToUpdate: stateLabel)
        
        //Cities DropDown:
        DropDownFunctions.setupDropDown(dropDown: citiesDropDown, anchor: cityView, dataSource: indianCities, labelToUpdate: cityLable)
        
        for step in stepperView{
            step.layer.cornerRadius = 20
            step.layer.borderWidth = 1
            step.layer.borderColor = UIColor.systemGray4.cgColor
        }
        
        addTapGestureToDismissKeyboard()
    }
    
    func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func openCompanyTypeDropDown(_ sender: Any) {
        companyTypeDropDown.show()
    }
    
    @IBAction func openCountryDropDown(_ sender: Any) {
        countriesDropDown.show()
    }
    
    @IBAction func openStateDropDown(_ sender: Any) {
        stateDropDown.show()
    }
    
    @IBAction func openCityDropDown(_ sender: Any) {
        citiesDropDown.show()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToLegalDocs(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "LegalDocsVC") as? LegalDocsVC {
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
}
