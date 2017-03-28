//
//  EATSideMenuCell.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit


class EATSideMenuCell: EATTableViewCell {
    static let bgSelectedColor = UIColor.init(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    static let bgDeselectedColor = UIColor.clear
    static let textSelectedColor = UIColor.black
    static let textDeselectedColor = UIColor.white
    
    @IBOutlet weak var itemNameLabel: UILabel!

    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        self.backgroundColor = selected ? EATSideMenuCell.bgSelectedColor : EATSideMenuCell.bgDeselectedColor
        itemNameLabel.textColor = selected ? EATSideMenuCell.textSelectedColor : EATSideMenuCell.textDeselectedColor
    }
    
    
    //MARK: - Public

    override class var identifier : String {
        return "EATSideMenuCell"
    }
}
