//
//  ViewController.swift
//  Eaterator
//
//  Created by Roudique on 2/10/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON
import Kingfisher


let kLogInText = "Log in using Facebook"
let kLogOutText = "Log Out"
let kNotLoggedInText = "You are not logged in"


class EATSideController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var menuTableView: UITableView!
    var menuController : EATSideMenuTableViewController!
    weak var menuControllerDelegate : EATSideMenuDelegate?
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.adjustsFontSizeToFitWidth = true
        
        applyGradient()
        
        setUpMenuController()
    }
    
    
    //MARK: - Actions
    
    @IBAction func facebookLogin(_ sender: UIButton) {
        if self.isLoggedIn() {
            logout()
            self.loginButton.setTitle(kLogInText, for: .normal)
        } else {
            login()
        }
    }
    
    
    //MARK: - Private
    
    func setUpMenuController() {
        menuController = EATSideMenuTableViewController()
        menuController.tableView = menuTableView
        menuController.delegate = menuControllerDelegate
        menuTableView.delegate = menuController
        menuTableView.dataSource = menuController
        
        addChildViewController(menuController)
        menuController.didMove(toParentViewController: self)
    }
    
    func login() {
        let fbLoginManager = FBSDKLoginManager.init()
        fbLoginManager.logOut()
        
        let permissions = ["public_profile", "email", "user_birthday"]
        
        fbLoginManager.logIn(withReadPermissions: permissions, from: self) { result, error in
            if (error != nil) {
                print("\(error?.localizedDescription)")
            } else if (result?.isCancelled)! {
                print("Login canceled!")
            } else {
                let request = FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields" : "first_name, last_name, email, birthday, picture"])
                
                request?.start(completionHandler: { _, result, error in
                    if (error == nil) {
                        let token = FBSDKAccessToken.current()
                        
                        var firstName, lastName, picture : String?
                        if let dict = result as? Dictionary<String, Any> {
                            if let first_name = dict["first_name"] as? String {
                                firstName = first_name
                            }
                            
                            if let last_name = dict["last_name"] as? String {
                                lastName = last_name
                            }
                            
                            if let pictureDict = dict["picture"] as? Dictionary<String, Any> {
                                if let dataDict = pictureDict["data"] as? Dictionary<String, Any> {
                                    if let url = dataDict["url"] {
                                        picture = url as? String
                                    }
                                }
                            }
                        }
                        
                        if let firstName = firstName, let lastName = lastName {
                            let user = EATUser.init(firstName: firstName, lastName: lastName, avatarLink: picture)
                            
                            self.nameLabel.text = "\(user.firstName) \(user.lastName)"
                            
                            if let token = token {
                                
                                let parameters : Parameters = [
                                    "social_id" : token.userID,
                                    "auth_token" : token.tokenString,
                                    "first_name" : user.firstName,
                                    "last_name" : user.lastName
                                ]
                                
                                print(token.expirationDate)
                                
                                let url = URL.init(string: "https://www.eaterator.com/auth/app/facebook")
                                
                                Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                                    .responseJSON { response in
                                        print(response.result.value)
                                        
                                        if let dict = response.result.value as? Dictionary<String, Any> {
                                            if let access_token = dict["access_token"] as? String {
                                                let sessionManager = EATUserSessionManager.shared
                                                
                                                sessionManager.token        = access_token
                                                sessionManager.userId       = token.userID
                                                sessionManager.firstName    = user.firstName
                                                sessionManager.lastName     = user.lastName
                                                
                                                self.loginButton.setTitle(kLogOutText, for: .normal)
                                                
                                                if let avatar = user.avatarLink {
                                                    self.avatarImageView.kf.setImage(with: URL(string: avatar))
                                                }
                                            }
                                        }
                                }
                            }
                        }
                    }
                })
            }
        }
    }
    
    func logout() {
        let fbLoginManager = FBSDKLoginManager.init()
        fbLoginManager.logOut()
        EATUserSessionManager.shared.logout()
        
        self.nameLabel.text = kNotLoggedInText
        self.avatarImageView.image = nil
    }
    
    func isLoggedIn() -> Bool {
        if let _ = EATUserSessionManager.shared.token {
            return true
        }
        return false
    }
    
    func applyGradient() {
        view.applyGradient(colors: [UIColor(red:0.12, green:0.51, blue:0.30, alpha:1.00),
                                    UIColor(red:0.40, green:0.80, blue:0.60, alpha:1.00)],
                           start: .topRight, end: .botLeft)
    }
}

