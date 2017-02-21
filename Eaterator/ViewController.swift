//
//  ViewController.swift
//  Eaterator
//
//  Created by Roudique on 2/10/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Alamofire
import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loginButton.readPermissions = ["public_profile", "email"]
        loginButton.delegate = self
        
        if FBSDKAccessToken.current() != nil {
            FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields" : "name, email"]).start(completionHandler: { connection, result, error in
                if let result = result {
                    print(result)
                }
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestAction(_ sender: UIButton) {
        
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print(result.grantedPermissions)
        FBSDKProfile.loadCurrentProfile(completion: { profile, error in
            guard error == nil else {
                print("Error: \(error)")
                return
            }
            
            if let name = profile?.name {
                print("Name: \(name)")
            } else {
                print("Couldn't load profile")
            }
        })
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Logged out")
    }


}

