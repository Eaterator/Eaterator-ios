//
//  UIViewController+Error.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

extension UIViewController {
    func showError(message: String?) {
        HUD.show(.label(message))
        HUD.hide(afterDelay: 3)
    }
}
