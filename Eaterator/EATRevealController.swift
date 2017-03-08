//
//  RevealController.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class EATRevealController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "navController") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "sideController") {
            self.rightViewController = controller
        }
        
        let padding : CGFloat = 50.0
        SlideMenuOptions.rightViewWidth = UIScreen.main.bounds.width - padding
                
        super.awakeFromNib()
    }

}
