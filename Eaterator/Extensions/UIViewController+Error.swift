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

class EATBaseController : UIViewController {
    var bgView : UIView? = UIView()
    
    func startSpinnerAnimation() {
        view.isUserInteractionEnabled = false
        
        let bgSize = CGFloat(150.0)
        let margin = CGFloat(8.0)

        bgView = UIView()
        bgView?.frame = CGRect.init(x: self.view.bounds.size.width / 2.0 - bgSize / 2.0,
                                   y: self.view.bounds.size.height / 2.0 - bgSize / 2.0,
                                   width: bgSize, height: bgSize)
        bgView?.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        bgView?.layer.cornerRadius = 15.0
        
        let logoImageView = UIImageView.init(image: #imageLiteral(resourceName: "logo_small"))
        let size = CGFloat(100.0)
        logoImageView.frame = CGRect.init(x: bgSize / 2.0 - size / 2.0,
                                          y: bgSize / 2.0 - size / 2.0,
                                          width: size, height: size)
        
        let labelHeight = CGFloat(25.0)
        let loadingLabel = UILabel()
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: bgSize - labelHeight - margin, width: bgSize, height: labelHeight)
        loadingLabel.font = UIFont(name: "Avenir Next", size: 18.0)
        loadingLabel.textColor = .white
        loadingLabel.textAlignment = .center
        
        bgView?.addSubview(logoImageView)
        bgView?.addSubview(loadingLabel)
        self.view.addSubview(bgView!)
        
        
        
        logoImageView.rotate360Degrees()
    }
    
    func stopSpinnerAnimation() {
        view.isUserInteractionEnabled = true
        bgView?.removeFromSuperview()
        bgView = nil
    }
}

extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 1.5, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2.0)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = Float.infinity
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
