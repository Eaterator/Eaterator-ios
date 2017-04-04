//
//  EATSearchController.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import PKHUD

let kSearchToRecipesSegue = "searchToRecipes"


class EATSearchController: UIViewController, UITableViewDataSource, UITableViewDelegate,
                            UITextFieldDelegate {
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addToSearchField: UITextField!

    var ingredients = [String]()
    var foundRecipes = [EATRecipe]()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
        
        addToSearchField.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(self.hideKeyboard)))
        
        prepareDummyData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == kSearchToRecipesSegue {
            let controller = segue.destination as! EATRecipesController
            
            controller.recipes = foundRecipes
        }
    }
    
    func prepareDummyData() {
        self.ingredients = ["rice", "chicken", "beans"]
    }
    
    
    //MARK: - Actions
    
    @IBAction func searchAction(_ sender: UIButton) {
        if ingredients.count > 2 {
            HUD.flash(.progress)
            
            EATAPIManager.shared.searchForRecipes(with: ingredients) { recipes, error in
                HUD.hide()
                
                if let error = error {
                    self.showError(message: "\(error.domain), error code: \(error.code)")
                    return
                }
                
                if recipes.isEmpty {
                    self.showError(message: "No recipes were found :(")
                    return
                }
                
                print("---------------------------")
                for recipe in recipes {
                    print("recipe:: \(recipe.title)")
                }
                self.foundRecipes = recipes
                self.performSegue(withIdentifier: kSearchToRecipesSegue, sender: nil)
                print("---------------------------")

            }
        } else {
            showError(message: "Please, enter more ingredients!")
        }
    }
    
    @IBAction func addToSearchAction(_ sender: UIButton) {
        guard let textToSearch = addToSearchField.text else { return }
        guard !textToSearch.isEmpty else { return }
        
        addToSearchField.text = ""
        
        ingredients.insert(textToSearch, at: 0)
        tableView.reloadData()
    }
    
    func deleteFromSearchAction(_ sender: UIButton) {
        let index = sender.tag
        
        ingredients.remove(at: index)
        
        tableView.reloadData()
    }
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return craftItemCell(name: ingredients[indexPath.row], indexPath: indexPath)
    }
    
    
    
    //MARK: - UITableViewDelegate
    
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return false
    }
    

    //MARK: - Private
    
    func craftItemCell(name: String, indexPath: IndexPath) -> EATSearchItemCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATSearchItemCell.identifier) as! EATSearchItemCell
        cell.label.text = name
        
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteFromSearchAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
    
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    
}
