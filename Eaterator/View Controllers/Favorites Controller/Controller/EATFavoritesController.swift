//
//  EATFavoritesController.swift
//  Eaterator
//
//  Created by Roudique on 4/4/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATFavoritesController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
        
        EATAPIManager.shared.getFavoriteRecipes { recipes, error in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
