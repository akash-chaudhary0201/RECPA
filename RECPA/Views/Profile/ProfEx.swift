//
//  ProfEx.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 26/06/25.
//

import UIKit
import WebKit

class ProfEx: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://pg.its.edu.in/sites/all/themes/extrude/video/old/tour.html") {
            webView.load(URLRequest(url: url))
        }
    }
    
}
