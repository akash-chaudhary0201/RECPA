//
//  UploadedFilesVC.swift
//  RECPA
//
//  Created by Akash Chaudhary  on 28/07/25.
//

import UIKit

class UploadedFilesVC: UIViewController {
    
    @IBOutlet weak var uploadedFileImageView: UIImageView!
    
    //File paths from userdefaults;
    var aadharPath:String = ""
    var panPath:String = ""
    var reraPath:String = ""
    var chequePath:String = ""
    var selfiePath:String = ""
    
    var fileType:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchAndPrintUploadedFilePaths()
        loadFileImage()
        print("------------------\(fileType)")
        
    }
    
    func fetchAndPrintUploadedFilePaths() {
        panPath = UserDefaults.standard.string(forKey: UploadedFileKey.pan.rawValue)!
        aadharPath = UserDefaults.standard.string(forKey: UploadedFileKey.aadhar.rawValue)!
        reraPath = UserDefaults.standard.string(forKey: UploadedFileKey.reraCert.rawValue)!
        chequePath = UserDefaults.standard.string(forKey: UploadedFileKey.cheque.rawValue)!
        selfiePath = UserDefaults.standard.string(forKey: UploadedFileKey.selfie.rawValue)!
    }
    
    func loadFileImage(){
        if fileType == "pan"{
            
            if FileManager.default.fileExists(atPath: panPath) {
                if let image = UIImage(contentsOfFile: panPath) {
                    uploadedFileImageView.image = image
                } else {
                    print("Failed")
                }
                
            } else {
                print("PAN not exist at path: \(panPath)")
            }
        }else if fileType == "aadhar"{
           
           if FileManager.default.fileExists(atPath: aadharPath) {
               if let image = UIImage(contentsOfFile: aadharPath) {
                   uploadedFileImageView.image = image
               } else {
                   print("Failed")
               }
               
           } else {
               print("Aadhar not exist at path: \(aadharPath)")
           }
        }else if fileType == "rera"{
           
           if FileManager.default.fileExists(atPath: reraPath) {
               if let image = UIImage(contentsOfFile: reraPath) {
                   uploadedFileImageView.image = image
               } else {
                   print("Failed")
               }
               
           } else {
               print("PAN not exist at path: \(reraPath)")
           }
        }else if fileType == "cheque"{
           
           if FileManager.default.fileExists(atPath: chequePath) {
               if let image = UIImage(contentsOfFile: chequePath) {
                   uploadedFileImageView.image = image
               } else {
                   print("Failed")
               }
               
           } else {
               print("PAN not exist at path: \(chequePath)")
           }
        }else if fileType == "selfie"{
           
           if FileManager.default.fileExists(atPath: selfiePath) {
               if let image = UIImage(contentsOfFile: selfiePath) {
                   uploadedFileImageView.image = image
               } else {
                   print("Failed")
               }
               
           } else {
               print("PAN not exist at path: \(selfiePath)")
           }
        }
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
