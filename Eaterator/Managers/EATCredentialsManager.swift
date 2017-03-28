//
//  EATCredentialsManager.swift
//  Eaterator
//
//  Created by Roudique on 3/15/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SwiftyJSON

class EATCredentialsManager {
    static var shared = EATCredentialsManager()
    
    var key : String?
    var secret : String?
    
    init() {
        if let path = Bundle.main.url(forResource: "credentials", withExtension: "json") {
            if let data = try? Data.init(contentsOf: path) {
                let json = JSON(data: data)
                let flickrJSON = json["flickr"]
                
                key = flickrJSON["key"].string
                secret = flickrJSON["secret"].string
            }
        }
    }
}
