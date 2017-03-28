//
//  EATSideMenuCell.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATSideMenuCell: EATTableViewCell {
    @IBOutlet weak var itemNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class var identifier : String {
        return "EATSideMenuCell"
    }
    

}
