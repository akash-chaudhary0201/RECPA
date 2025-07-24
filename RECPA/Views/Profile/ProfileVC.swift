//
//  ProfileVC.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 19/06/25.
//

import UIKit

class ProfileVC: UIViewController {
    
    //All buttons outlet:
    @IBOutlet weak var personalInfoButton: UIButton!
    @IBOutlet weak var statInfoButton: UIButton!
    @IBOutlet weak var agentsButton: UIButton!
    
    @IBOutlet weak var agentsInfo: UIView!
    @IBOutlet weak var statInfo: UIView!
    @IBOutlet weak var personalInfo: UIView!
    @IBOutlet weak var belowLabel: UILabel!
    
    //Agents Info outlets:
    @IBOutlet weak var allAgentsTable: UITableView!
    @IBOutlet weak var agentsTableHeight: NSLayoutConstraint!
    
    let borderTag = 999
    
    //Agents example array:
    var agentsArray:[String] = ["Akash", "Sumit", "Rakshit", "Pandey", "Akash", "Sumit", "Rakshit", "Pandey", "Akash"]
    
    //Active constraint:
    var activeConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        
        personalInfo.isHidden = false
        statInfo.isHidden = true
        agentsInfo.isHidden = true
        
        applyDefaultConstraints()
        
        DispatchQueue.main.async{
            self.addBottomBorder(to: self.personalInfoButton)
        }
        agentsTableHeight.constant = CGFloat(agentsArray.count * 95)
    }

    //-----------------All Functions for constraints-----------------------
    
    func clearPreviousConstraints() {
        NSLayoutConstraint.deactivate(activeConstraints)
        activeConstraints.removeAll()
    }
    
    func applyDefaultConstraints() {
        clearPreviousConstraints()
        
        let statToPersonal = statInfo.bottomAnchor.constraint(equalTo: personalInfo.bottomAnchor)
        let agentsToPersonal = agentsInfo.bottomAnchor.constraint(equalTo: personalInfo.bottomAnchor)
        
        activeConstraints.append(contentsOf: [statToPersonal, agentsToPersonal])
        NSLayoutConstraint.activate(activeConstraints)
    }
    
    func showOnlyStatInfo() {
        clearPreviousConstraints()
        
        let statToLabel = statInfo.topAnchor.constraint(equalTo: belowLabel.bottomAnchor)
        let agentsToStat = agentsInfo.bottomAnchor.constraint(equalTo: statInfo.bottomAnchor)
        
        activeConstraints.append(contentsOf: [statToLabel, agentsToStat])
        NSLayoutConstraint.activate(activeConstraints)
    }
    
    func showOnlyAgentsInfo() {
        clearPreviousConstraints()
        
        let agentsToLabel = agentsInfo.topAnchor.constraint(equalTo: belowLabel.bottomAnchor)
        activeConstraints.append(agentsToLabel)
        NSLayoutConstraint.activate(activeConstraints)
    }
    
    //--------------------------------------------
    
    //Function to add bottom border to selected button:
    func addBottomBorder(to button: UIButton) {
        removeAllButtonBorders()
        
        let border = CALayer()
        border.backgroundColor = UIColor.brown.cgColor
        border.frame = CGRect(x: 0, y: button.frame.height - 2, width: button.frame.width, height: 2)
        border.name = "bottomBorder"
        border.setValue(borderTag, forKey: "tag")
        button.layer.addSublayer(border)
    }

    func removeAllButtonBorders() {
        for btn in [personalInfoButton, statInfoButton, agentsButton] {
            btn?.layer.sublayers?.removeAll(where: {
                $0.value(forKey: "tag") as? Int == borderTag
            })
        }
    }
    //-----------------------------
    
    @IBAction func topButtonTapped(_ sender: UIButton){
        print("\(sender.tag) Button Tapped")
        
        addBottomBorder(to: sender)
        
        switch sender.tag {
        case 0:
            personalInfo.isHidden = false
            statInfo.isHidden = true
            agentsInfo.isHidden = true
            applyDefaultConstraints()
            
        case 1:
            personalInfo.isHidden = true
            statInfo.isHidden = false
            agentsInfo.isHidden = true
            showOnlyStatInfo()
            
        case 2:
            personalInfo.isHidden = true
            statInfo.isHidden = true
            agentsInfo.isHidden = false
            showOnlyAgentsInfo()
            
        default:
            break
        }
    }
}

extension ProfileVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allAgentsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllAgentsTableCell
        
        cell.selectionStyle = .none
        return cell
    }
    
    
}

class AllAgentsTableCell:UITableViewCell{
    
}
