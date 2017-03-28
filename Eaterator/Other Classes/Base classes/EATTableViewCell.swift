//
//  EATTableViewCell.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

protocol EATModelCell {
    func configure(with model: EATModel)
}

class EATTableViewCell: UITableViewCell {
    
    class var identifier : String {
        assert(false, "identifier() is not implemented in \(NSStringFromClass(self)) class")
        
        return "EATTableViewCell"
    }
    
    

}
