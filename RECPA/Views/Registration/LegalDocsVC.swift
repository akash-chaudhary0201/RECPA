//
//  LegalDocsVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/06/25.
//

enum UploadedFileKey: String {
    case pan = "uploadedPanFile"
    case aadhar = "uploadedAadharFile"
    case selfie = "uploadedSelfieFile"
    case cheque = "uploadedChequeFile"
    case reraCert = "uploadedReraCertFile"
}

import UIKit
import UniformTypeIdentifiers

class LegalDocsVC: UIViewController, UIDocumentPickerDelegate {
    
    @IBOutlet weak var selfieView: UIView?
    @IBOutlet weak var canceledChequeView: UIView?
    @IBOutlet weak var reraCertificateView: UIView?
    @IBOutlet weak var reraRenewDate: UILabel?
    @IBOutlet weak var reraRenewView: UIView?
    @IBOutlet weak var reraRegView: UIView?
    @IBOutlet weak var reraRegDate: UILabel?
    @IBOutlet weak var noButton: UIButton?
    @IBOutlet weak var yesButton: UIButton?
    @IBOutlet weak var aadharView: UIView?
    @IBOutlet weak var panView: UIView?
    @IBOutlet weak var backButton: UIButton?
    @IBOutlet weak var nextButton: UIButton?
    @IBOutlet weak var viewToHide: UIView?
    @IBOutlet weak var gstView: UIView!
    @IBOutlet weak var gstViewHeight: NSLayoutConstraint!
    @IBOutlet var stepperView: [UIView]!
    
    var isGstApplicable:Bool = false
    
    var activeDateLabel:UILabel?
    
    var userType:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userType = UserDefaults.standard.string(forKey: "userType")
        setupUI()
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
    
    //Current file type:
    var currentFileTypeKey: UploadedFileKey?
    
    //Function setup UI
    func setupUI(){
        
        //Hiding gst details:
        gstView.isHidden = true
        gstViewHeight.constant = 0
        
        if userType == "agent"{
            viewToHide?.isHidden = true
            let constraint = NSLayoutConstraint(
                item: aadharView!,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: viewToHide!,
                attribute: .bottom,
                multiplier: 1,
                constant: 0
            )
            NSLayoutConstraint.activate([constraint])
        }
        
        for step in stepperView{
            step.layer.cornerRadius = 20
            step.layer.borderWidth = 1
            step.layer.borderColor = UIColor.systemGray4.cgColor
        }
    }
    
    //Common function for document picker:
    func presentDocumentPicker() {
        let supportedTypes: [UTType] = [UTType.data]
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: supportedTypes, asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    //Action to select pan:
    @IBAction func openPanFileAction(_ sender: Any) {
        currentFileTypeKey = .pan
        presentDocumentPicker()
    }
    
    //Action to select aadhar:
    @IBAction func openAadharFileAction(_ sender: Any) {
        currentFileTypeKey = .aadhar
        presentDocumentPicker()
    }
    
    //back Action:
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Function to open rera registration date selector:
    @IBAction func openReraRegDateSelector(_ sender: Any) {
        DatePickerHelper.showCenteredDatePicker(on: self) { selectedDate in
            self.reraRegDate?.text = selectedDate
            self.reraRegDate?.textColor = .black
        }
    }
    
    //Function to open rera renewal date selector:
    @IBAction func openReraRenewDatePicker(_ sender: Any) {
        DatePickerHelper.showCenteredDatePicker(on: self) { selectedDate in
            self.reraRenewDate?.text = selectedDate
            self.reraRenewDate?.textColor = .black
        }
    }
    
    //Action to select rera certifdficate:
    @IBAction func openReraCertFileAction(_ sender: Any) {
        currentFileTypeKey = .reraCert
        presentDocumentPicker()
    }
    
    
    //Action to select cheque:
    @IBAction func selectChequeFile(_ sender: Any) {
        currentFileTypeKey = .cheque
        presentDocumentPicker()
    }
    
    //Action for GST Button:
    @IBAction func yesGstButtonAction(_ sender: Any) {
        gstView.isHidden = false
        gstViewHeight.constant = 70
        yesButton?.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 1.0)
        yesButton?.borderColor = .clear
        yesButton?.tintColor = .white
        noButton?.backgroundColor = .clear
        noButton?.tintColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 1.0)
        noButton?.borderColor = .lightGray
    }
    
    @IBAction func noGstButtonAction(_ sender: Any) {
        gstView.isHidden = true
        gstViewHeight.constant = 0
        noButton?.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 1.0)
        noButton?.tintColor = .white
        noButton?.borderColor = .clear
        yesButton?.backgroundColor = .clear
        yesButton?.tintColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 1.0)
        yesButton?.borderColor = .lightGray
    }
    
    //Action to select selfie:
    @IBAction func selectSelfirFile(_ sender: Any) {
        currentFileTypeKey = .selfie
        presentDocumentPicker()
    }
    
    //Go to review information page:
    @IBAction func goToReviewInfo(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Registration", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "ReviewInfoVC") as? ReviewInfoVC{
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }
    
    //Delegate function for document picker:
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedURL = urls.first, let fileTypeKey = currentFileTypeKey else { return }
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsURL.appendingPathComponent(selectedURL.lastPathComponent)
        
        do {
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }
            try fileManager.copyItem(at: selectedURL, to: destinationURL)
            
            UserDefaults.standard.set(destinationURL.path, forKey: fileTypeKey.rawValue)
            print(" Saved \(fileTypeKey.rawValue) to: \(destinationURL.path)")
            
        } catch {
            print("Error in file: \(error.localizedDescription)")
        }
    }
    
    
    
}
