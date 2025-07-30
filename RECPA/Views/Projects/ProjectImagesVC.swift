//
//  ProjectImagesVC.swift
//  RECPA
//
//  Created by Akash Chaudhary  on 28/07/25.
//

import UIKit
import FSPagerView

class ProjectImagesVC: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate {
    
    @IBOutlet weak var pagerView: FSPagerView!
    
    var imageNames = ["Property Image", "loginBack", "IMG_0158", "Profile cover banner", "Property Image", "Profile cover banner"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Pager view setup :-
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3.0
        pagerView.transformer = FSPagerViewTransformer(type: .crossFading)
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 6
       
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit
//        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
