//
//  NewsProfile.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 12/20/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsProfile {
    var firstName: String
    var lastName: String
    var avatar: String
    var id: Int
    
    init(json: JSON) {
        self.avatar = json["photo_50"].stringValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.id = json["id"].intValue
    }
}
