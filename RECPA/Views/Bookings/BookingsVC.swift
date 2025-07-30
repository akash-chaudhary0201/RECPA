//
//  BookingsVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 27/06/25.
//

import UIKit
import SwiftyGif

class BookingsVC: UIViewController {
    
    @IBOutlet weak var comingSoon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let gif = try UIImage(gifName: "cmm.gif")
            comingSoon.setGifImage(gif, loopCount: -1)
        } catch {
            print("Error loading GIF: \(error)")
        }
    }
    
}
