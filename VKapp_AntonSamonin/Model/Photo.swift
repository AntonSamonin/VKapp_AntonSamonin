//
//  Photo.swift
//  VKapp_AntonSamonin
//
//  Created by Anton Samonin on 11/12/18.
//  Copyright © 2018 AntCo. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

@objcMembers
class Photo: Object {
  dynamic var id: Int = 0
  dynamic  var ownerID: Int = 0
  dynamic var photo = ""

 let owner = LinkingObjects(fromType: User.self, property: "photos")
    
   convenience init(json: JSON) {
    self.init()
        self.id = json["id"].intValue
        self.ownerID = json["owner_id"].intValue
        self.photo = json["sizes"][7]["url"].stringValue
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


//{
//    "response": {
//        "count": 60,
//        "items": [
//        {
//        "id": 456240434,
//        "album_id": -6,
//        "owner_id": 143074171,
//        "sizes": [
//        {
//        "type": "m",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd43/5C-USWgqUZU.jpg",
//        "width": 130,
//        "height": 130
//        },
//        {
//        "type": "o",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd48/huy7v24VQnk.jpg",
//        "width": 130,
//        "height": 130
//        },
//        {
//        "type": "p",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd49/M-CggXIJKKY.jpg",
//        "width": 200,
//        "height": 200
//        },
//        {
//        "type": "q",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd4a/bOKbciS-hik.jpg",
//        "width": 320,
//        "height": 320
//        },
//        {
//        "type": "r",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd4b/jWD7f26Bz6s.jpg",
//        "width": 510,
//        "height": 510
//        },
//        {
//        "type": "s",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd42/ZWEHdTERsSA.jpg",
//        "width": 75,
//        "height": 75
//        },
//        {
//        "type": "w",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd47/QolJvY4T76E.jpg",
//        "width": 1353,
//        "height": 1353
//        },
//        {
//        "type": "x",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd44/tkniHQZtEJQ.jpg",
//        "width": 604,
//        "height": 604
//        },
//        {
//        "type": "y",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd45/yW71y_3x6kk.jpg",
//        "width": 807,
//        "height": 807
//        },
//        {
//        "type": "z",
//        "url": "https://pp.userapi.com/c845017/v845017902/6dd46/IsnXLqWpF-Q.jpg",
//        "width": 1080,
//        "height": 1080
//        }
//        ],
//        "text": "",
//        "date": 1528035560,
//        "lat": 40.722183,
//        "long": -73.996522,
//        "post_id": 2679
//}
