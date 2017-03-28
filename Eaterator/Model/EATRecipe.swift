//
//  EATRecipe.swift
//  Eaterator
//
//  Created by Roudique on 3/28/17.
//  Copyright © 2017 Eaterator. All rights reserved.
//

import UIKit

class EATRecipe {
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
    let url: String
    let averageRating: Double
    
    var thumbnailLink: String?
    var imageLink: String?
    
    init(id: Int, title: String, url: String, rating: Double) {
        self.id = id
        self.title = title
        self.url = url
        self.averageRating = rating
    }
    
}
