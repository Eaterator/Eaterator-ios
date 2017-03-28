//
//  EATIngredient.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SwiftyJSON

class EATIngredient {
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
    
//    convenience init(json: JSON) {
//        
//    }
}
