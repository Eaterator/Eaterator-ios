//
//  EATUserSessionManager.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATUserSessionManager {
    static let shared = EATUserSessionManager()
    
    var token : String? {
        get {
            if self.token == nil {
                if let storedToken = UserDefaults.standard.value(forKey: "token") as? String {
                    self.token = storedToken
                }
            }
            
            return self.token
        }
        
        set(newToken) {
            UserDefaults.standard.set(newToken, forKey: "token")
        }
    }
}
