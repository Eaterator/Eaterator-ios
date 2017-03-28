//
//  EATRecipesController.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATRecipesController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var recipes = [EATRecipe]()

    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let recipe = recipes[indexPath.row]
        
        EATAPIManager.shared.detailsOfRecipe(recipe.id) { recipe, error in
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}
