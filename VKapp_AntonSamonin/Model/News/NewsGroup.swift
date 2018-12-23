//
//  NewsGroups.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/20/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsGroup {
    
    var id: Int
    var name: String
    var avatar: String
    
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.avatar = json["photo_50"].stringValue
        self.name = json["name"].stringValue
    }
}
