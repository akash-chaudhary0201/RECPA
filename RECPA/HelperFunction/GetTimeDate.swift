//
//  GetTimeDate.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/07/25.
//

import UIKit
import Foundation

class GetTimeAndDate {
    static func getDate(dateFormat: String) -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: currentDate)
        
        
        return dateString
    }
    
    static func getTime(timeFormat: String) -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = timeFormat
        let timeString = dateFormatter.string(from: currentDate)
        
        return timeString
    }
}
