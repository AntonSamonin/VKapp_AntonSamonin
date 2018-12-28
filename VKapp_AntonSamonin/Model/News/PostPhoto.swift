//
//  PostPhoto.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/26/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostPhoto {
    var type: String
    var ownerId: Int
    var photo: String
    var text: String
    var date: Double
    var likes: Int
    var reposts: Int
    var comments: Int
    
    init(json: JSON) {
        self.type = json["type"].stringValue
        self.ownerId = json["owner_id"].intValue
        self.photo = json["photo_604"].stringValue
        self.text = json["text"].stringValue
        self.date = json["date"].doubleValue
        self.likes = json["likes"]["count"].intValue
        self.reposts = json["reposts"]["count"].intValue
        self.comments = json["comments"]["count"].intValue
    }
}
