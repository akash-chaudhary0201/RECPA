//
//  ProjectsVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 19/06/25.
//

import UIKit
import SDWebImage
import SwiftLoader

class ProjectsVC: UIViewController {
    
    @IBOutlet weak var openFilterButton: UIButton!
    @IBOutlet weak var filterCollection: UICollectionView!
    @IBOutlet weak var allProjectTable: UITableView!
    @IBOutlet weak var filterCollectionHeight: NSLayoutConstraint!
    
    var projectFilterArray:[String] = ["Filter", "Sort By", "Project Type", "Location", "Status", "Budget Range"]
    
    var isFilterOpen:Bool = false
    
    var dynamicHeight:Double?
    var screenHeight:Double?
    
    override func viewDidLoad() {
        
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: allProjectTable.frame.width, height: 100))
        footerView.backgroundColor = .clear
        
        allProjectTable.tableFooterView = footerView
        
        screenHeight = UIScreen.main.bounds.height
        dynamicHeight = screenHeight! * 0.4
        
        super.viewDidLoad()
        
        allProjectTable.separatorStyle = .none
        
        filterCollection.isHidden = true
        filterCollectionHeight.constant = 0
        
        SwiftLoaderHelper.setLoader()
        
        Task{
            await PropertyService.getAllProperties { status in
                DispatchQueue.main.async {
                    if status{
                        self.allProjectTable.reloadData()
                        print(self.allProjectTable.rowHeight)
                        SwiftLoader.hide()
                    }
                }
            }
        }
    }
    
    @IBAction func openFiltersAction(_ sender: Any) {
        
        if isFilterOpen{
            filterCollection.isHidden = true
            filterCollectionHeight.constant = 0
            openFilterButton.backgroundColor = .white
            openFilterButton.setImage(UIImage(named: "filterGreen"), for: .normal)
            isFilterOpen = false
        }else{
            filterCollection.isHidden = false
            filterCollectionHeight.constant = 36
            openFilterButton.backgroundColor = UIColor(red: 35/255, green: 75/255, blue: 52/255, alpha: 255/255)
            openFilterButton.setImage(UIImage(named: "filterWhite"), for: .normal)
            
            print("Background image set to filterWhite")
            isFilterOpen = true
        }
    }
}

//Extension for table:
extension ProjectsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalData.allProperties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allProjectTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllProjectTableCell
        
        cell.selectionStyle = .none
        
        let singleProperty = GlobalData.allProperties[indexPath.row]
        
        let imageUrl = URL(string: singleProperty.imageUrl ?? "a")
        cell.projectImage.sd_setImage(with: imageUrl)
        cell.projectName.text = singleProperty.name
        cell.projectAddress.text = singleProperty.address
        cell.projectBudget.text = singleProperty.budget
        cell.projectStatus.text = singleProperty.status
        cell.projectRooms.text = singleProperty.rooms
        cell.imageHeight.constant = dynamicHeight! - 150.0
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dynamicHeight!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleProperty = GlobalData.allProperties[indexPath.row]
        let storyboard = UIStoryboard(name: "Projects", bundle: nil)
        if let nextController = storyboard.instantiateViewController(withIdentifier: "ProjDetViewController") as? ProjDetViewController{
            nextController.projectId = singleProperty.id
            self.navigationController?.pushViewController(nextController, animated: true)
        }
    }

}

//Extension for collection:
extension ProjectsVC:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projectFilterArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = filterCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AllProjectFilters
        
        cell.filterName.text = projectFilterArray[indexPath.row]
        
        return cell
    }
}

class AllProjectTableCell:UITableViewCell{
    
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var projectImage: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectAddress: UILabel!
    @IBOutlet weak var projectBudget: UILabel!
    @IBOutlet weak var projectStatus: UILabel!
    @IBOutlet weak var projectRooms: UILabel!
}


class AllProjectFilters:UICollectionViewCell{
    
    @IBOutlet weak var filterName: UILabel!
}
