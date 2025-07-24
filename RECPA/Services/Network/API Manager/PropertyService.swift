//
//  PropertyService.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/07/25.
//

import Foundation
import UIKit

class PropertyService {
    
    //Function to get all properties:
    public static func getAllProperties(completion: @escaping (Bool) -> Void) async {
        guard let url = URL(string: APIManager.APPUrl.getProperties) else {
            completion(false)
            return
        }

        GlobalData.allProperties.removeAll()

        do {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for propertyDict in jsonArray {
                    let property = PropertyModel(dict: propertyDict)
                    GlobalData.allProperties.append(property)
                }
                completion(true)
            } else {
                print("Failed to cast JSON to [[String: Any]]")
                completion(false)
            }

        } catch {
            print("Error fetching properties: \(error.localizedDescription)")
            completion(false)
        }
    }
}

