//
//  EATRecipesController.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit


let kShowRecipeDetailSegueIdentifier = "showRecipeDetail"

let recipeCellHeight = CGFloat(90.0)

class EATRecipesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recipes = [EATRecipe]()

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let recipe = sender as? EATRecipe {
            let controller = segue.destination as! EATDetailRecipeController
            controller.recipe = recipe
        }
    }

    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATRecipeCell.identifier) as! EATRecipeCell
        
        let model = recipes[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeId = recipes[indexPath.row].id
        
        EATAPIManager.shared.detailsOfRecipe(recipeId) { recipe, error in
            guard error == nil else {
                self.showError(message: error?.domain)
                return
            }
            
            self.performSegue(withIdentifier: kShowRecipeDetailSegueIdentifier, sender: recipe)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return recipeCellHeight
    }

}
