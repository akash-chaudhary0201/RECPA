//
//  PropertyModel.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary on 23/06/25.
//

import Foundation

struct PropertyModel {
    var name: String?
    var budget: String?
    var address: String?
    var status: String?
    var type: String?
    var city: String?
    var state: String?
    var reraNo: String?
    var reraDate: String?
    var imageUrl: String?
    var id: String?
    var rooms: String?
    var projectCode: String?
    var completionDate: String?
    var noOfTowers: String?
    var noOfUnits: String?
    var description: String?
    
    init(dict: [String: Any]) {
        self.name = dict["name"] as? String
        self.budget = dict["budget"] as? String
        self.address = dict["address"] as? String
        self.status = dict["status"] as? String
        self.type = dict["type"] as? String
        self.city = dict["city"] as? String
        self.state = dict["state"] as? String
        self.reraNo = dict["reraNo"] as? String
        self.reraDate = dict["reraDate"] as? String
        self.imageUrl = dict["imageUrl"] as? String
        self.id = dict["id"] as? String
        self.rooms = dict["rooms"] as? String
        self.projectCode = dict["projectCode"] as? String
        self.completionDate = dict["completionDate"] as? String
        self.noOfTowers = dict["noOfTowers"] as? String
        self.noOfUnits = dict["noOfUnits"] as? String
        self.description = dict["description"] as? String
    }
}

