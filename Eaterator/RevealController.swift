//
//  RevealController.swift
//  Eaterator
//
//  Created by Roudique on 3/7/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class RevealController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "navController") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "sideController") {
            self.rightViewController = controller
        }
        
        super.awakeFromNib()
    }

}
