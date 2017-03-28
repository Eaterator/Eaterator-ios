//
//  EATSideMenuTableViewController.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit


struct EATSideMenuItem {
    let id: Int
    let name: String
    var action: () -> ()
}


class EATSideMenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let menuItems = [EATSideMenuItem.init(id: 0, name: "Recipe Search", action: {print("Recipe Search")}),
                     EATSideMenuItem.init(id: 1, name: "Favorites", action: {print("Favorites")}),
                     EATSideMenuItem.init(id: 2, name: "Search history", action: {print("Search history")})]
    let selectedIndex = 0
    

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATSideMenuCell.identifier) as! EATSideMenuCell
        
        let item = menuItems[indexPath.row]
        cell.itemNameLabel.text = item.name
        
        if indexPath.row == selectedIndex {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        } else if cell.isSelected {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = menuItems[indexPath.row]
        item.action()
    }
    
}
