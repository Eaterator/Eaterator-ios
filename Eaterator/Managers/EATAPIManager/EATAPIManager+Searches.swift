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
            print("asd")
        }
    }
    
}
