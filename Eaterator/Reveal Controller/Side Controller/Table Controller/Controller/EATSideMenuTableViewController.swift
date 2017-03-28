//
//  EATSideMenuTableViewController.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATSideMenuTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    let menuItemTitles = ["Favorites", "Recipe Search"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATSideMenuCell.identifier) as! EATSideMenuCell
        
        cell.itemNameLabel.text = menuItemTitles[indexPath.row]
        
        return cell
    }
    
    
    //MARK: - UITableViewDelegate

}
