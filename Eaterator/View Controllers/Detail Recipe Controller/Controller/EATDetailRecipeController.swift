//
//  EATDetailRecipeController.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import Kingfisher

class EATDetailRecipeController: UIViewController {
    var recipe: EATRecipe!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var ingredientsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleModel()
    }
    
    
    //MARK: - Actions
    
    @IBAction func linkButtonAction(_ sender: UIButton) {
        if recipe.url != nil {
            if let url = URL(string: recipe.url!) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [UIApplicationOpenURLOptionUniversalLinksOnly : false], completionHandler: nil)
                }
            }
        }
    }
    
    
    //MARK: - Private
    
    func handleModel() {
        titleLabel.text = recipe.title
        
        var ingredientsListString = "Ingredients:\n"
        for ingredient in recipe.ingredients {
            ingredientsListString += " • \(ingredient.name)\n"
        }
        
        ingredientsTextView.text = ingredientsListString
        
        if let imageLink = recipe.imageLink {
            if let url = URL(string: imageLink) {
                photoImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "thumbnail"), options: nil, progressBlock: nil, completionHandler: nil)
            }
        }
        
    }
    

}
