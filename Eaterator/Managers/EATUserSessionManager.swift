//
//  EATUserSessionManager.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

let kTokenKey = "token"
let kUserIdKey = "userId"
let kFirstNameKey = "firstName"
let kLastNameKey = "lastName"

class EATUserSessionManager {
    static let shared = EATUserSessionManager()
    
    func logout() {
        token = nil
        userId = nil
        firstName = nil
        lastName = nil
    }
    
    var token : String? /*{
        get {
            if self.token == nil {
                if let storedToken = UserDefaults.standard.value(forKey: kTokenKey) as? String {
                    self.token = storedToken
                }
            }
            
            return self.token
        }
        
        set(newToken) {
            UserDefaults.standard.set(newToken, forKey: kTokenKey)
        }
    }*/
    
    var userId : String? /*{
        get {
            if self.userId == nil {
                if let storedUserId = UserDefaults.standard.value(forKey: kUserIdKey) as? String {
                    self.userId = storedUserId
                }
            }
            
            return self.userId
        }
        
        set(newUserId) {
            UserDefaults.standard.set(newUserId, forKey: kUserIdKey)
        }
    }*/
    
    var firstName : String? /*{
        get {
            if self.firstName == nil {
                if let storedFirstName = UserDefaults.standard.value(forKey: kFirstNameKey) as? String {
                    self.firstName = storedFirstName
                }
            }
            
            return self.firstName
        }
        
        set(newFirstName) {
            UserDefaults.standard.set(newFirstName, forKey: kFirstNameKey)
        }
    }*/
    
    var lastName  : String? /*{
        get {
            if self.lastName == nil {
                if let storedLastName = UserDefaults.standard.value(forKey: kLastNameKey) as? String {
                    self.lastName = storedLastName
                }
            }
            
            return self.lastName
        }
        
        set(newLastName) {
            UserDefaults.standard.set(newLastName, forKey: kLastNameKey)
        }
    }*/
}
