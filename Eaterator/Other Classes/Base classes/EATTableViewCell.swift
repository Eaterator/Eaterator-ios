//
//  EATTableViewCell.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATTableViewCell: UITableViewCell {
    
    class var identifier : String {
        assert(false, "identifier() is not implemented in \(NSStringFromClass(self)) class")
        
        return "EATTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
