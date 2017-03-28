//
//  EATAPIManager+RecipeDetail.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Foundation
import Alamofire

let recipeDetailUrl = "/recipe/recipe/"

extension EATAPIManager {
    func detailsOfRecipe(_ id: Int, recipe completion: (EATRecipe, NSError?) -> ()) -> () {
        let url = URL.init(string: "\(baseUrl)\(recipeDetailUrl)pk:\(id)")
        
        Alamofire.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: self.headers()).responseJSON { response in
            print("lol")
        }
    }
}
