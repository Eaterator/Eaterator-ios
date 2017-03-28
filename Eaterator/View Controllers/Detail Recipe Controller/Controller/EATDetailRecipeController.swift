//
//  EATDetailRecipeController.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Private
    
    func handleModel() {
        titleLabel.text = recipe.title
        
    }
    

}
