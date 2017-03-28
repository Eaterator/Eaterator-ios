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
    
    func headers() -> Dictionary<String, String> {
        var headers = Dictionary<String, String>()
        if let token = EATUserSessionManager.shared.token {
            headers["Authorization"] = "Bearer \(token)"
        }
        return headers
    }
    
    func searchForRecipes(with ingredients: [String], recipeNames completion: @escaping ([EATRecipe], NSError?) -> ()) {        
        let url = URL.init(string: "\(baseUrl)\(searchUrl)")
        
        let parameters: Parameters = [
            "ingredients": ingredients
        ]
        
        Alamofire.request(url!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers()).responseJSON { response in
            guard response.result.value != nil else {
                let code = response.response?.statusCode
                let error = NSError.init(domain: "No response :(", code: code ?? -1, userInfo: nil)
                completion([], error)
                return
            }
            
            let json = JSON(response.result.value!)
            
            var recipes = [EATRecipe]()
            
            if let recipesJSON = json["recipes"].array {
                for recipeJSON in recipesJSON {
                    if let recipe = EATRecipe.init(json: recipeJSON) {
                        recipes.append(recipe)
                    }
                }
            }
            
            completion(recipes, nil)
        }
    }
    
    func searchForImage(with name: String) {
//        Alamofire.req
    }
}
