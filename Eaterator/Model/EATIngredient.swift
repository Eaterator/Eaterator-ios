//
//  EATIngredient.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SwiftyJSON

//"ingredient": {
//    "name": "potato"
//    "modifier": "small"
//    "amount": 4
//    "unit": None
//}

class EATIngredient: EATModel {
    let name: String
    let modifier: String?
    let amount: Int?
    let unit: String?

    init(name: String, modifier: String?, amount: Int?, unit: String?) {
        self.name       = name
        self.modifier   = modifier
        self.amount     = amount
        self.unit       = unit
    }
    
    required init?(json: JSON) {
        let name    = json["name"].string
        modifier    = json["modifier"].string
        amount      = json["amount"].int
        unit        = json["unit"].string
        
        if let name = name {
            self.name = name
        } else {
            return nil
        }
    }
}
