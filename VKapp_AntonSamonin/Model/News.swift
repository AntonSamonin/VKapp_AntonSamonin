//
//  News.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 10/19/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsPost {
    var postAuthor: String
    var postImage: String
    var postText: String
    var avatar: String
    var likes: Int
    var reposts: Int
    var views: Int

    init(json: JSON) {
      self.avatar = json[""].stringValue
        self.postAuthor = json[""].stringValue
        self.postImage = json[""].stringValue
        self.postText = json[""].stringValue
        self.likes = json[""].intValue
        self.reposts = json[""].intValue
        self.views = json[""].intValue
    }
}
