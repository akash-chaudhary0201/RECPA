//
//  APIManager.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/07/25.
//

class APIManager{
    struct APPUrl{
        private struct Domains {
            static let Dev = "https://cp.com/admin"
            static let QA = "https://cp.com/admin"
            static let Prod = "https://cp.com/admin"
            static let mockApi = "https://68592c77138a18086dfd5b81.mockapi.io"
        }
        
        private  struct Routes {
            static let Api = "/api"
            static let Version = "/v1"
        }
        
        private struct Entity{
            static var properties = "/properties"
        }
        
        private  static let Domain = Domains.mockApi
        private  static let Route = Routes.Api
        private  static let Version = Routes.Version
        
        //Cretaing api url:
        static var getProperties:String{
            return Domain + Route + Entity.properties + "/allProperties"
        }
        
    }
}
