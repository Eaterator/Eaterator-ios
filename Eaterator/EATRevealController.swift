//
//  RevealController.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class EATRevealController: SlideMenuController, EATSideMenuDelegate {
    var sideController : EATSideController!
    var searchNavController : UINavigationController!
    var favoritesNavController : UINavigationController!
    var historyNavController : UINavigationController!
    
    var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func awakeFromNib() {
        if let sideController = self.storyboard?.instantiateViewController(withIdentifier: "sideController") {
            self.sideController = sideController as! EATSideController
            self.sideController.menuControllerDelegate = self
        }
        if let searchNavController = self.storyboard?.instantiateViewController(withIdentifier: "searchNavController") {
            self.searchNavController = searchNavController as! UINavigationController
        }
        if let favoritesNavController = self.storyboard?.instantiateViewController(withIdentifier: "favNavController") {
            self.favoritesNavController = favoritesNavController as! UINavigationController
        }
        if let historyNavController = self.storyboard?.instantiateViewController(withIdentifier: "histNavController") {
            self.historyNavController = historyNavController as! UINavigationController
        }
        
        self.mainViewController = searchNavController
        self.rightViewController = sideController
        
        controllers = [searchNavController, favoritesNavController, historyNavController]
        
        let padding : CGFloat = 50.0
        SlideMenuOptions.rightViewWidth = UIScreen.main.bounds.width - padding
                
        super.awakeFromNib()
    }
    
    
    //MARK: - EATSideMenuDelegate
    
    func didChooseController(at index: Int) {
        showController(at: index)
    }
    
    func showController(at index: Int) {
        if index < controllers.count {
            self.changeMainViewController(controllers[index], close: true)
        }
    }

}
