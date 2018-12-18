//
//  User.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 11/10/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
@objcMembers
class User: Object {
   dynamic var id: Int = 0
   dynamic var firstName = ""
   dynamic var lastName = ""
   dynamic var avatar = ""
    
    let photos = List<Photo>()
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.avatar = json["photo_100"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func  indexedProperties() -> [String] {
        return ["firstName", "lastName"]
    }
    
   
}


//{
//    "response": {
//        "count": 117,
//        "items": [
//        {
//        "id": 141134756,
//        "first_name": "Вика",
//        "last_name": "Бобровская",
//        "city": {
//        "id": 123,
//        "title": "Самара"
//        },
//        "photo_100": "https://pp.userapi.com/c847020/v847020231/f2b6d/z_jyKhN-aEQ.jpg?ava=1",
//        "online": 0
//}
