//
//  EATRecipe.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit
import SwiftyJSON

class EATRecipe : EATModel {
//    "pk": 1234
//    "title": "My great recipe"
//    "url": "http://foodnetwork.com.recipe/my-great-recipe
//    "average_rating": 3.4
//    "lowest_rating": 1
//    "count_rating": 34
//    "highest_rating": 4
//    "medium_img": "https://flickr.com/234243_m.jpg"
//    "thumbnail": "https://flickr.com/234243.jpb
    
    let id: Int
    let title: String
    let averageRating: Double
    
    var url: String?
    var thumbnailLink: String?
    var imageLink: String?
    
    init(id: Int, title: String, rating: Double) {
        self.id = id
        self.title = title
        self.averageRating = rating
    }
    
    required init?(json: JSON) {
        let id      = json["pk"].int
        let title   = json["title"].string
        let rating  = json["average_rating"].double
        
        if let id = id, let title = title, let rating = rating {
            self.id             = id
            self.title          = title
            self.averageRating  = rating
            
            self.thumbnailLink  = json["thumbnail"].string
            self.imageLink      = json["medium_img"].string
            self.url            = json["url"].string
            
        } else {
            return nil
        }
        
    }
    
}
