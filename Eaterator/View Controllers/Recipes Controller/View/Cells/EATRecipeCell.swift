//
//  EATRecipeCell.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import Kingfisher

class EATRecipeCell: EATTableViewCell, EATModelCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView?

    override class var identifier : String {
        return "EATRecipeCell"
    }
    
    func configure(with model: EATModel) {
        if let recipe = model as? EATRecipe {
            nameLabel.text = recipe.title
            ratingLabel.text = recipe.averageRating.format(f: ".1")
            
            if let link = recipe.thumbnailLink {
                if let url = URL.init(string: link) {
                    self.thumbnailImageView?.kf.setImage(with: url)
                }
            }
        }
    }

}
