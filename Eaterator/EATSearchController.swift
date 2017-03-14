//
//  EATSearchController.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class EATSearchController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var ingredients = [String]()
    
    @IBAction func searchAction(_ sender: UIButton) {
        EATAPIManager.shared.searchForRecipes(with: ["potato", "chicken", "tomato"]) { recipes in
            for recipe in recipes {
                print("recipe: \(recipe)")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
        
        self.tableView.tableHeaderView = self.craftSearchCell()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return craftItemCell()
    }
    
    
    
    //MARK: - UITableViewDelegate
    

    //MARK: - Private
    
    func craftSearchCell() -> EATAddToSearchCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATAddToSearchCell.identifier) as! EATAddToSearchCell
        
        return cell
    }
    
    func craftItemCell() -> EATSearchItemCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EATSearchItemCell.identifier) as! EATSearchItemCell
        
        return cell
    }
    
}
