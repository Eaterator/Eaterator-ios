//
//  EATAPIManager+RecipeDetail.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let recipeDetailUrl = "/recipe/recipe/"

//"recipe": {
//        "recipe": {
//            "pk": 1234
//            "title": "My great recipe"
//            "url": "http://foodnetwork.com.recipe/my-great-recipe
//            "average_rating": 3.4
//            "lowest_rating": 1
//            "count_rating": 34
//            "highest_rating": 4
//            "medium_img": "https://flickr.com/234243_m.jpg"
//            "thumbnail": "https://flickr.com/234243.jpb
//        },
//        "ingredients": [
//        {
//        "ingredient": {
//        "name": "potato"
//        "modifier": "small"
//        "amount": 4
//        "unit": None
//        }
//        }
//        ]
//    }

extension EATAPIManager {
    
    func detailsOfRecipe(_ id: Int, recipe completion: @escaping (EATRecipe?, NSError?) -> ()) -> () {
        let url = URL.init(string: "\(baseUrl)\(recipeDetailUrl)\(id)")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: self.headers()).responseJSON { response in
            guard response.result.value != nil else {
                let code = response.response?.statusCode
                let error = NSError.init(domain: "No response :(", code: code ?? -1, userInfo: nil)
                completion(nil, error)
                return
            }
            
            let json = JSON(response.result.value!)
            let dataJSON = json["recipe"].dictionary
            
            if let recipeJSON = dataJSON?["recipe"] {
                let recipe = EATRecipe.init(json: recipeJSON)
                
                if let ingredientsJSON = dataJSON?["ingredients"]?.array {
                    for ingredientJSON in ingredientsJSON {
                        if let ingredient = EATIngredient.init(json: ingredientJSON["ingredient"]) {
                            recipe?.ingredients.append(ingredient)
                        }
                    }
                }
                
                completion(recipe, nil)
            } else {
                let error = NSError.init(domain: "Error parsing JSON", code: -1, userInfo: nil)
                completion(nil, error)
            }
            
            
            
        }
    }
}
