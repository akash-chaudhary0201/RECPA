//
//  Defaults.swift
//  RealEstateCP
//
//  Created by Akash Chaudhary  on 17/07/25.
//

import UIKit
import Foundation

class Defaults{
    
    static var accessToken: String? {
        get {
            return UserDefaults.standard.object(forKey: "accessToken") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "accessToken")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    static var userId: String? {
        get {
            return UserDefaults.standard.object(forKey: "UserId") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserId")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    static var userName: String? {
        get {
            return UserDefaults.standard.object(forKey: "UserName") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserName")
            UserDefaults.standard.synchronize()
        }
    }

    static var userEmail: String? {
        get {
            return UserDefaults.standard.object(forKey: "UserEmail") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserEmail")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userPassword: String? {
        get {
            return UserDefaults.standard.object(forKey: "UserPassword") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserPassword")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userLastName: String? {
        get {
            return UserDefaults.standard.object(forKey: "userLastName") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userLastName")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userFirstName: String? {
        get {
            return UserDefaults.standard.object(forKey: "userFirstName") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userFirstName")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var userMobileNumber: String? {
        get {
            return UserDefaults.standard.object(forKey: "userMobileNumber") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userMobileNumber")
            UserDefaults.standard.synchronize()
        }
    }
    
    static var isUserLoggedIn: Bool? {
        get {
            return UserDefaults.standard.object(forKey: "IsUserLoggedIn") as? Bool ?? false
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "IsUserLoggedIn")
            UserDefaults.standard.synchronize()
        }
    }
}
