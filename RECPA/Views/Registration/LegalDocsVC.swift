//
//  LegalDocsVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/06/25.
//

import UIKit
import UniformTypeIdentifiers

class LegalDocsVC: UIViewController, UIDocumentPickerDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
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
    
    //Text fields outlets:
    @IBOutlet weak var panTextField: UITextField!
    @IBOutlet weak var aadharTextField: UITextField!
    @IBOutlet weak var gstTextField: UITextField!
    @IBOutlet weak var reraTextField: UITextField!
    
    
    
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
        DatePickerHelper.showInlineDatePicker(centerIn: self.view, targetLabel: reraRegDate!, "dd-mm-yyyy")
    }
    
    //Function to open rera renewal date selector:
    @IBAction func openReraRenewDatePicker(_ sender: Any) {
        DatePickerHelper.showInlineDatePicker(centerIn: self.view, targetLabel: reraRenewDate!, "dd-mm-yyyy")
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
        
        let alert = UIAlertController(title: "Upload Selfie", message: "Choose a source", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.presentCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "File Picker", style: .default, handler: { _ in
            self.presentDocumentPicker()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = (sender as! UIView).bounds
            popoverController.permittedArrowDirections = [.up, .down]
        }
        
        present(alert, animated: true)
    }
    
    //Function to present camera:
    func presentCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("Camera not available on device")
            return
        }
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        picker.allowsEditing = false
        present(picker, animated: true)
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
            print("Source: \(selectedURL.path)")
            print("Destination: \(destinationURL.path)")
            
            if fileManager.fileExists(atPath: destinationURL.path) {
                try fileManager.removeItem(at: destinationURL)
            }
            try fileManager.copyItem(at: selectedURL, to: destinationURL)
            
            UserDefaults.standard.set(destinationURL.path, forKey: fileTypeKey.rawValue)
            print("Saved \(fileTypeKey.rawValue) to: \(destinationURL.path)")
            
        } catch {
            print("Error : \(error.localizedDescription)")
        }
    }
    
    //Delegate function for image click from camera:
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.originalImage] as? UIImage,
              let fileTypeKey = currentFileTypeKey else { return }
        
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        let fileName = "\(UUID().uuidString).jpg"
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsURL.appendingPathComponent(fileName)
        
        do {
            try imageData.write(to: fileURL)
            UserDefaults.standard.set(fileURL.path, forKey: fileTypeKey.rawValue)
            print("Saved image to: \(fileURL.path)")
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
        }
    }
    
    
    
}
