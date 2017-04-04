//
//  EATFavoritesController.swift
//  Eaterator
//
//  Created by Roudique on 4/4/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit


let showFavRecipeDetailSegueId = "showFavoriteRecipeDetail"


class EATFavoritesController: UIViewController,
                                UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var recipes = [EATRecipe]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showFavRecipeDetailSegueId {
            let recipe = sender as! EATRecipe
            let controller = segue.destination as! EATDetailRecipeController
            controller.recipe = recipe
        }
    }
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATRecipeCell.identifier) as! EATRecipeCell
        
        let model = recipes[indexPath.row]
        cell.configure(with: model)
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return recipeCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeId = recipes[indexPath.row].id
        
        EATAPIManager.shared.detailsOfRecipe(recipeId) { recipe, error in
            guard error == nil else {
                self.showError(message: error?.domain)
                return
            }
            
            self.performSegue(withIdentifier: showFavRecipeDetailSegueId, sender: recipe)
        }
    }
    
    //MARK: - Private
    
    func reloadData() {
        EATAPIManager.shared.getFavoriteRecipes { recipes, error in
            if let recipes = recipes {
                self.recipes = recipes
            }
            
            self.tableView.reloadData()
        }
    }

}
