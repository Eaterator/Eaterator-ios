//
//  EATAPIManager.swift
//  Eaterator
//
//  Created by Roudique on 3/14/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let baseUrl = "https://www.eaterator.com"
let searchUrl = "/recipe/search"

class EATAPIManager {
    static let shared = EATAPIManager()
    
    func searchForRecipes(with ingredients: [String], recipeNames completion: @escaping ([String]) -> ()) {
        var headers = Dictionary<String, String>()
        if let token = EATUserSessionManager.shared.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let url = URL.init(string: "\(baseUrl)\(searchUrl)")
        
        let parameters: Parameters = [
            "ingredients": ingredients
        ]
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            let json = JSON(response.result.value!)
            
            var recipeNames = [String]()
            
            if let recipes = json["recipes"].array {
                for recipe in recipes {
                    if let title = recipe["title"].string {
                        recipeNames.append(title)
                    }
                }
            }
            
            completion(recipeNames)
        }
    }
    
    func searchForImage(with name: String) {
//        Alamofire.req
    }
}
