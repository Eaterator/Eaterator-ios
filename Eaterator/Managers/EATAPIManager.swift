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
    
    func searchForRecipes(with ingredients: [String], completion: @escaping ([String]) -> ()) {
        var headers = Dictionary<String, String>()
        if let token = EATUserSessionManager.shared.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        
        let url = URL.init(string: "https://www.eaterator.com/recipe/search")
        
        let parameters: Parameters = [
            "ingredients": ingredients
        ]
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            let json = JSON(response.result.value!)
            
            var recipeNames = [String]()
            
            for recipe in json["recipes"].array! {
                recipeNames.append(recipe["title"].string!)
            }
            
            completion(recipeNames)
        }
    }
}
