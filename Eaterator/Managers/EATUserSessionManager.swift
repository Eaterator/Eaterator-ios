//
//  EATUserSessionManager.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

let kTokenKey       = "token"
let kUserIdKey      = "userId"
let kFirstNameKey   = "firstName"
let kLastNameKey    = "lastName"
let kPictureUrlKey  = "picture"

class EATUserSessionManager {
    static let shared = EATUserSessionManager()
    
    init() {
        login()
    }
    
    func login() {
        self.token      = UserDefaults.standard.object(forKey: kTokenKey) as? String
        self.userId     = UserDefaults.standard.object(forKey: kUserIdKey) as? String
        self.firstName  = UserDefaults.standard.object(forKey: kFirstNameKey) as? String
        self.lastName   = UserDefaults.standard.object(forKey: kLastNameKey) as? String
        self.picture    = UserDefaults.standard.object(forKey: kPictureUrlKey) as? String
    }
    
    func logout() {
        token       = nil
        userId      = nil
        firstName   = nil
        lastName    = nil
        picture     = nil
        
        UserDefaults.standard.removeObject(forKey: kTokenKey)
        UserDefaults.standard.removeObject(forKey: kUserIdKey)
        UserDefaults.standard.removeObject(forKey: kFirstNameKey)
        UserDefaults.standard.removeObject(forKey: kLastNameKey)
        UserDefaults.standard.removeObject(forKey: kPictureUrlKey)
    }
    
    var token : String? {
        didSet {
            UserDefaults.standard.set(token, forKey: kTokenKey)
        }
    }
    
    var userId : String? {
        didSet {
            UserDefaults.standard.set(userId, forKey: kUserIdKey)
        }
    }
    
    var firstName : String? {
        didSet {
            UserDefaults.standard.set(firstName, forKey: kFirstNameKey)
        }
    }
    
    var lastName  : String? {
        didSet {
            UserDefaults.standard.set(lastName, forKey: kLastNameKey)
        }
    }
    
    var picture : String? {
        didSet {
            UserDefaults.standard.set(picture, forKey: kPictureUrlKey)
        }
    }
}
