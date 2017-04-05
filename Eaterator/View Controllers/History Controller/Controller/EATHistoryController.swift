//
//  EATHistoryController.swift
//  Eaterator
//
//  Created by Roudique on 4/4/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit


let historyCellHeight = CGFloat(100.0)


class EATHistoryController: UIViewController,
                            UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var searches = [[String]]()
    
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
    }
    

    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATHistoryCell.identifier) as! EATHistoryCell
        
        var ingredientsString = ""
        
        let search = searches[indexPath.row]
        
        for ingredient in search {
            if search.last! == ingredient {
                ingredientsString += ingredient
            } else {
                ingredientsString += "\(ingredient), "
            }
        }
        
        cell.ingredientsLabel.text = ingredientsString
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return historyCellHeight;
    }
    
    
    //MARK: - Private
    
    func reloadData() {
        EATAPIManager.shared.getRecentSearches { searches, error in
            if let searches = searches {
                self.searches = searches
            }
            self.tableView.reloadData()
        }
    }
}


















