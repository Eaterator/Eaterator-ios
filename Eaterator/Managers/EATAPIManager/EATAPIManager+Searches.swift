//
//  EATAPIManager+Searches.swift
//  Eaterator
//
//  Created by Roudique on 4/4/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let searchesUrl = "/user/recent-searches/20"

extension EATAPIManager {
    
    func getRecentSearches(with completion: @escaping ([[String]]?, NSError?) -> ()) {
        let url = URL.init(string: "\(baseUrl)\(searchesUrl)")!
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers()).responseJSON { response in
            guard response.result.value != nil else {
                let code = response.response?.statusCode
                let error = NSError.init(domain: "No response :(", code: code ?? -1, userInfo: nil)
                completion(nil, error)
                return
            }
            
            var searches = [[String]]()
            
            let json = JSON(response.result.value!)
            if let searchesJSON = json["searches"].array {
                for searchJSON in searchesJSON {
                    let dict = searchJSON["search"]
                    let jsonFromString = JSON.init(parseJSON: dict.stringValue)
                    let ingredientsJSON = jsonFromString["ingredients"].arrayValue
                    var ingredients = [String]()
                    for ingredientJSON in ingredientsJSON {
                        ingredients.append(ingredientJSON.stringValue)
                    }
                    searches.append(ingredients)
                                        
//                    if let dict = searchJSON.array?.first {
//                        let jsonFromString = JSON.init(parseJSON: dict.stringValue)
//                        let ingredientsJSON = jsonFromString["ingredients"].arrayValue
//                        var ingredients = [String]()
//                        for ingredientJSON in ingredientsJSON {
//                            ingredients.append(ingredientJSON.stringValue)
//                        }
//                        searches.append(ingredients)
//                    }
                }
            }
            
            completion(searches, nil)
        }
    }
    
}
