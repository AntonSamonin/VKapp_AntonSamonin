//
//  News.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/19/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import SwiftyJSON

class Post {
    var postText: String
    var sourceId: Int
    var postDate: Double
    var likes: Int
    var reposts: Int
   
    var comments: Int

    init(json: JSON) {
        self.postText = json["text"].stringValue
        self.postDate = json["date"].doubleValue
        self.sourceId = json["source_id"].intValue
        self.likes = json["likes"]["count"].intValue
        self.reposts = json["reposts"]["count"].intValue
        self.comments = json["comments"]["count"].intValue
    }
}
