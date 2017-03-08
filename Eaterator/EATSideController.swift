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

class EATSideController: UIViewController/*, FBSDKLoginButtonDelegate*/ {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func facebookLogin(_ sender: UIButton) {
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
                            
                            if let avatar = user.avatarLink {
                                self.avatarImageView.kf.setImage(with: URL(string: avatar))
                            }
                            
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
                                                EATUserSessionManager.shared.token = access_token
                                            }
                                        }
                                        
                                }
                                
                                print("We got user ID and token.")
                            }
                        }
                    }
                })
            }
        }
    }
}

