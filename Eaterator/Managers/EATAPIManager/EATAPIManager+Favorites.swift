//
//  EATAPIManager+Favorites.swift
//  Eaterator
//
//  Created by Roudique on 4/4/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let favoriteRecipesUrl = "/user/favourite-recipes"
let addFavoriteRecipeUrl = "/user/favourite-recipe/"


extension EATAPIManager {
    func getFavoriteRecipes(recipes completion: @escaping ([EATRecipe]?, NSError?) -> ()) -> () {
         let url = URL.init(string: "\(baseUrl)\(favoriteRecipesUrl)")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: self.headers()).responseJSON { response in
            
            guard response.result.value != nil else {
                let code = response.response?.statusCode
                let error = NSError.init(domain: "No response :(", code: code ?? -1, userInfo: nil)
                completion(nil, error)
                return
            }
            
            let json = JSON(response.result.value!)
            let dataJSON = json["recipes"].array
            var recipes = [EATRecipe]()
            
            if let dataArray = dataJSON {
                for recipeJSON in dataArray {
                    if let recipe = EATRecipe.init(json: recipeJSON) {
                        recipes.append(recipe)
                    }
                }
            } else {
                let error = NSError.init(domain: "Error parsing JSON", code: -1, userInfo: nil)
                completion(nil, error)
                return
            }
            
            completion(recipes, nil)
        }
    }
    
    func addFavoriteRecipe(with id: Int) {
        let url = URL.init(string: "\(baseUrl)\(addFavoriteRecipeUrl)\(id)")
        
        Alamofire.request(url!, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: self.headers()).responseJSON { response in
            print("ololo")
        }
    }
}













